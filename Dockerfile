FROM node:alpine as builder

WORKDIR '/app'

COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN CI=true npm run build

FROM nginx
EXPOSE 8080
COPY --from=builder /app/build /usr/share/nginx/html
