# syntax=docker/dockerfile:1
ARG ENVAR=dev

FROM node:18 as builder

COPY projects/${ENVAR} /dev

WORKDIR 

ENV YARN_VERSION=1.16.0

RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz

RUN npm run build:$ENV


FROM nginx as app

COPY --from=builder dist/${ENV} /usr/share/nginx/html
