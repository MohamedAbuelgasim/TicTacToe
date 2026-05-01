FROM nginx:1.27-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY app/     /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 10000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:10000/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
