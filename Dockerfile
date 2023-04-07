FROM node:18.14.2-alpine3.17 as build-front
WORKDIR /usr/src/app
COPY . .
RUN yarn build

FROM nginx:stable-alpine
COPY --from=build-front /usr/src/app/packages/frontend/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
