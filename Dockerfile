FROM node:22 AS development
WORKDIR /usr/src/app
EXPOSE 1234
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --include=dev
COPY  . /usr/src/app
