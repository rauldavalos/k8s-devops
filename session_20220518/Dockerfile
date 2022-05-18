FROM node:4.6 as unittest
WORKDIR /app
ADD . /app
RUN echo "unit test"

FROM node:4.6 as coverage
WORKDIR /app
COPY --from=unittest /app /app
RUN echo "coverage and static analysis"

FROM node:4.6 as ui-tests
WORKDIR /app
COPY --from=coverage /app /app
RUN echo "UI tests"

FROM node:4.6 as final-artifact
WORKDIR /app
COPY --from=ui-tests /app /app
RUN echo "final artifact"

RUN npm install
EXPOSE 3000
CMD npm start
