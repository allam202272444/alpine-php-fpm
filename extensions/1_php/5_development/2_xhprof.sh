#!/bin/bash
apk add --no-cache graphviz ttf-freefont
cd /tmp && git clone https://github.com/akhomy/xhprof
cd /tmp/xhprof/extension && phpize && \
  ./configure && \
  make && \
  make install && \
  echo 'extension=xhprof.so' > /etc/php7/conf.d/xhprof.ini && \
  echo 'xhprof.output_dir=/var/xhprof/logs' >> /etc/php7/conf.d/xhprof.ini
mkdir /var/xhprof && mkdir /var/xhprof/logs
chmod -R 777 /var/xhprof
