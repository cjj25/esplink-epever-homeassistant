#!/bin/bash
while true
do
  killall socat
  socat pty,link=/dev/ttyXRUSB0 "tcp:${ESP_LINK_TCP_ADDR}" &
  /opt/epever/entrypoint.sh
  test $? -gt 128 && break
  sleep 1s
done