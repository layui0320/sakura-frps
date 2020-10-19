FROM arm64v8/alpine:3.10

LABEL maintainer="layui0320"

ENV FRP_VERSION 0.28.2

RUN cd /root \
    &&  wget --no-check-certificate -c  https://github.com/ZeroDream-CN/SakuraFrp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_arm64.tar.gz \
    &&  tar zxvf frp_${FRP_VERSION}_linux_arm64.tar.gz  \
    &&  cd frp_${FRP_VERSION}_linux_arm64/ \
    &&  cp frps /usr/bin/ \
    &&  mkdir -p /etc/frp \
    &&  cp frps.ini /etc/frp \
    &&  cd /root \
    &&  rm frp_${FRP_VERSION}_linux_arm64.tar.gz \
    &&  rm -rf frp_${FRP_VERSION}_linux_arm64/ 

ENTRYPOINT /usr/bin/frps -c /etc/frp/frps.ini
