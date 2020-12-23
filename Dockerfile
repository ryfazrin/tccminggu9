FROM alpine:latest
RUN apk add --update nginx && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /tmp/nginx/

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
ADD index.html /usr/share/nginx/html/

EXPOSE 80

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
