#!/usr/bin/env bash

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service
sudo

lpadmin -p M2020 -E -m Samsung M2020 Series -v usb://Samsung/M2020%20Series?serial=074FB8GK7B03CPN
