FROM ubuntu:latest

#ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80

VOLUME /templates
ENV CONSUL_URL 10.0.0.247:8500
ADD haproxy.ctmpl  /templates/haproxy.ctmpl
ADD start.sh /bin/start.sh
#RUN rm -v /etc//conf.d/\*.conf
RUN apt-get update -y && apt-get install -y haproxy supervisor

#RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
#ADD https://github.com/hashicorp/consul-template/releases/download/v0.7.0/consul-template_0.7.0_linux_amd64.tar.gz /usr/bin/
#RUN tar -C /usr/bin --strip-components 1 -zxf /usr/bin/consul-template_0.7.0_linux_amd64.tar.gz
ADD consul-template /usr/bin/
ADD consul-template /usr/local/bin

#ENTRYPOINT ['/usr/sbin/haproxy']
#CMD ['-D', 'FOREGROUND']
#RUN consul-template -consul 10.0.0.247:8500 -template haproxy.ctmpl:/etc/haproxy/haproxy.conf -dry -once

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
