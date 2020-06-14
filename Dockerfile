FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8181
CMD ["/bin/sh", "-c", "if [ -n \"$FASTCGI_PASS\" ]; then sed -i s/localhost:9000/$FASTCGI_PASS/g /etc/nginx/conf.d/default.conf; fi; nginx -g \"daemon off;\""]
