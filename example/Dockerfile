FROM jerson/flutter:web AS build-env

WORKDIR  /app
COPY . .
RUN flutter upgrade
RUN cd example && flutter build web --release

FROM nginx

COPY --from=build-env /app/example/docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=build-env /app/example/build/web /usr/share/nginx/html
