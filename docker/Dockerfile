FROM alpine:latest
LABEL container.maintainer="xtoys <echoless@yeah.net>"
ENV SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    LANG=zh_CN.UTF-8 \
    TZ=Asia/Shanghai

COPY docker-entrypoint.sh /bin/entrypoint.sh
COPY scripts /scripts

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache \
       bash \
       tini \
       tzdata \
       python3 \
       py3-pip \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple \
    && pip install --upgrade requests \
    && chmod +x /bin/entrypoint.sh

WORKDIR /scripts 
ENTRYPOINT  ["tini","--","entrypoint.sh"]