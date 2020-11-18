FROM node:alpine as builder

WORKDIR '/usr/src/app'

COPY package.json ./

RUN npm install

# VOLUME /usr/src/app
# VOLUME /usr/src/app/node_modules

COPY ./ ./

RUN npm run build

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html