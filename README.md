# ESP-Link EPEver Home Assistant Integration

![ESP8266 AND EPEver](https://i.imgur.com/EgrwWq6.png)

---

### Based on [ned-kelly/docker-epever-homeassistant](https://github.com/ned-kelly/docker-epever-homeassistant)

## What is this?

---

1. Uses an ESP8266 flashed with the ESP-Link firmware, which is directly connected to an EPEver solar charger COM port
2. This container starts up the socat tool to bridge the serial interface over WiFi to act as a local tty connected device
3. Uses the work done by @ned-kelly to extract and export the EPEver stats into Home Assistant over MQTT

## How do I build my own module?

---
Follow the instructions provided by [Colin Hickey](https://www.youtube.com/watch?v=9tnc8Lpl3GA)

## How to use this image?

--- 

1. Follow the instructions provided at [ned-kelly/docker-epever-homeassistant](https://github.com/ned-kelly/docker-epever-homeassistant) and setup your `config/config.yml`
2. (if using docker-compose) Remove the `/dev/ttyXRUSB0:/dev/ttyXRUSB0` volume from the docker-compose.yml file
3. Use the additional environment `ESP_LINK_TCP_ADDR` to provide the TCP address of your ESP-Link module
   1. docker-compose.yml example
   ```
   environment:
    ESP_LINK_TCP_ADDR: 192.168.253.250:23
   ```
   2. docker run example
   ```
    docker run --rm -it -v $(pwd)/config/:/opt/epever/config/ \
    -e ESP_LINK_TCP_ADDR=192.168.253.250:23 \
    cjj25/solar-epever-homeassistant-esplink:latest    
   ```


Preview (more sensors available)

![EPEver in Home Assistant](https://i.imgur.com/yvNFi1G.png) 

## Background

---

I built an adapter with an ESP8266 to extract the statistics from the EPEver MPTT solar charger 
based on the fantastic information shared by Colin Hickey ([here](https://www.youtube.com/watch?v=rEdn8w4WdXA)) and further
inspiration from Adam Welch ([here](https://www.youtube.com/watch?v=V21DxV9H6vE))

## Credit

---

The project could not be possible without the following people:
- [Luca Soltoggio](https://github.com/toggio/PhpEpsolarTracer) - created the core library used to interface with the EPEver Protocol
- [David Nedved](https://github.com/ned-kelly/docker-epever-homeassistant) - provided the base image for simplifying integration into Home Assistant
- [Colin Hickey](https://www.youtube.com/watch?v=9tnc8Lpl3GA) - providing instructions on how to build this module
