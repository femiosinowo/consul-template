FROM haproxy:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80

VOLUME /templates
ENV CONSUL_URL 10.0.0.247:8500
ADD haproxy.ctmpl  /templates/haproxy.ctmpl
ADD start.sh /bin/start.sh
#RUN rm -v /etc//conf.d/\*.conf

ADD https://github.com/hashicorp/consul-template/releases/download/v0.7.0/consul-template_0.7.0_linux_amd64.tar.gz /usr/bin/
RUN tar -C /usr/bin --strip-components 1 -zxf /usr/bin/consul-template_0.7.0_linux_amd64.tar.gz
