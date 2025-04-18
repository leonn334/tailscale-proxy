FROM alpine:latest

RUN apk add --no-cache iproute2 iptables wireguard-tools curl bash

RUN curl -fsSL https://pkgs.tailscale.com/stable/tailscale_1.60.0_amd64.tgz | tar xz && \
    mv tailscale*/tailscale /usr/bin/tailscale && \
    mv tailscale*/tailscaled /usr/bin/tailscaled

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
