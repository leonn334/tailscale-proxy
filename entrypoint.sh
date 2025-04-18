#!/bin/sh

tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
sleep 2
tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=railway-proxy --ssh
tailscale ip -4
sleep infinity
