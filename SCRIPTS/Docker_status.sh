#!/bin/bash

if systemctl is-active --quiet docker
then
    echo "[OK] Docker service is running."
else
    echo "[ALERT] Docker service is NOT running."
fi
