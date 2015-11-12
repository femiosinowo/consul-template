#!/bin/bash
#service haproxy start
consul-template -consul=$CONSUL_URL -template="/templates/haproxy.ctmpl:/usr/local/etc/haproxy/haproxy.cfg:service haproxy reload"
