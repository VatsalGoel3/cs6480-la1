FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y \
    quagga \
    tcpdump \
    net-tools \
    && apt-get clean

RUN echo 'net.ipv4.ip_forward=1' >>  /etc/sysctl.conf && sysctl -p 
COPY r2-configs /etc/quagga/
CMD ["zebra", "-d"]
