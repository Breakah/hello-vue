FROM node:lts-buster as nodebuild
WORKDIR /build/
COPY . /build/
RUN npm install @vue/cli
ENTRYPOINT [ "npm","run","build" ]

FROM ngingx
COPY --from=nodebuild  /build/dist/ /usr/shere/nginx/html/
