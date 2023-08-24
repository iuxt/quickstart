FROM node:16 AS build-env
ADD sub-web /
WORKDIR /sub-web
RUN yarn && yarn build

FROM nginx
COPY --from=build-env dist /usr/share/nginx/html
