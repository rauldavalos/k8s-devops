# Phase I - Builder source
FROM python:latest as builder
# PYTHONUNBUFFERED Force logging to stdout / stderr not to be buffered into ram
ENV PYTHONUNBUFFERED=1
WORKDIR /usr/src/app
COPY flask-api/ ./
WORKDIR /wheels
COPY flask-api/requirements.txt ./requirements.txt
# PIP Will create an archive of our requirements libraries so we don't need to download them again in the next steps
# argument - wheel
RUN pip wheel -r ./requirements.txt


# Running Python lint - Code Analysis https://www.pylint.org/
FROM eeacms/pylint:latest as linting
WORKDIR /code
COPY --from=builder /usr/src/app/pylint.cfg /etc/pylint.cfg
COPY --from=builder /usr/src/app/*.py ./
COPY --from=builder /usr/src/app/api ./api
RUN ["/docker-entrypoint.sh", "pylint"]
