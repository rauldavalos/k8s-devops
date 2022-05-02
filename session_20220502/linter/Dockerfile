# Running Python lint - Code Analysis https://www.pylint.org/
FROM eeacms/pylint:latest as linting
WORKDIR /code
COPY --from=builder /usr/src/app/pylint.cfg /etc/pylint.cfg
COPY --from=builder /usr/src/app/*.py ./
COPY --from=builder /usr/src/app/api ./api
RUN ["/docker-entrypoint.sh", "pylint"]
