FROM node:buster

LABEL MAINTAINER buzzxu <downloadxu@163.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo \
    deb http://mirrors.163.com/debian/ buster main non-free contrib \
    deb http://mirrors.163.com/debian/ buster-updates main non-free contrib \
    deb http://mirrors.163.com/debian/ buster-backports main non-free contrib \
    deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib \
    deb-src http://mirrors.163.com/debian/ buster main non-free contrib \
    deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib \
    deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib \
    deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib \
    > /etc/apt/sources.list

RUN set -ex; \
    \
    savedAptMark="$(apt-mark showmanual)"; \
    \
    apt-get update && \
    rm /etc/localtime && 、
    ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    # Clean up
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app

ENV TZ=Asia/Shanghai
ENV LANG='C.UTF-8' LC_ALL='C.UTF-8'

CMD [ "node" ]
