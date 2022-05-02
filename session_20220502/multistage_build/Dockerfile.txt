# Phase I - Builder source
FROM python:latest as builder
# PYTHONUNBUFFERED Force logging to stdout / stderr not to be buffered into ram  
ENV PYTHONUNBUFFERED=1 
WORKDIR /usr/src/app
COPY flask-api/ ./
WORKDIR /wheels
COPY flask-api/requirements.txt ./requirements.txt
# PIP Will create an archive of our libraries so we don't need to download them again
# argument - wheel
RUN pip wheel -r ./requirements.txt 

# Lints Code
# Phase II
FROM eeacms/pylint:latest as linting
WORKDIR /code
COPY --from=builder /usr/src/app/pylint.cfg /etc/pylint.cfg
COPY --from=builder /usr/src/app/*.py ./
COPY --from=builder /usr/src/app/api ./api
RUN ["/docker-entrypoint.sh", "pylint"]

# Phase III Running Sonarqube scanner (Sonarqube server also required)
FROM newtmitch/sonar-scanner as sonarqube

WORKDIR /usr/src
COPY ./sonar-runner.properties /usr/lib/sonar-scanner/conf/sonar-scanner.properties
COPY --from=builder /usr/src/app/*.py ./
COPY --from=builder /usr/src/app/api ./api
RUN sonar-scanner -Dsonar.projectBaseDir=/usr/src

# Runs Unit Tests
# Phase IV
FROM python:latest as unit-tests
WORKDIR /usr/src/app
# Copy all packages instead of rerunning pip install
COPY --from=builder /wheels /wheels
RUN     pip install -r /wheels/requirements.txt \
                      -f /wheels \
       && rm -rf /wheels \
       && rm -rf /root/.cache/pip/* 

COPY --from=builder /usr/src/app/ ./
RUN ["make", "test"]

# Starts and Serves Web Page
# Phase VI
FROM python:3.8-slim as serve
WORKDIR /usr/src/app
# Copy all packages instead of rerunning pip install
COPY --from=builder /wheels /wheels
RUN     pip install -r /wheels/requirements.txt \
                      -f /wheels \
       && rm -rf /wheels \
       && rm -rf /root/.cache/pip/* 

COPY --from=builder /usr/src/app/*.py ./
COPY --from=builder /usr/src/app/api ./api
CMD ["python", "run_app.py"]
