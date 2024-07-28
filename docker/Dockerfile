# syntax=docker/dockerfile:1
ARG NODE_VERSION=18.0.0

FROM node:${NODE_VERSION} AS builder

ARG ENVAR=branchdev

COPY projects/${ENVAR} /${ENVAR}

RUN ls -all /${ENVAR}

WORKDIR /${ENVAR}

ENV YARN_VERSION=1.16.0

RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz

RUN npm run build:$ENVAR

FROM nginx AS app

ARG ENVAR=branchdev

COPY --from=builder /${ENVAR}/dist/${ENVAR} /usr/share/nginx/html
