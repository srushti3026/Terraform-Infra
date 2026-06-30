#!/bin/bash

THRESHOLD=80
EXIT_CODE=0

while read usage mount
do
    usage=${usage%\%}

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "[ALERT] $mount is ${usage}% full"
        EXIT_CODE=1
    else
        echo "[OK] $mount is ${usage}% full"
    fi

done < <(df -P | awk 'NR>1 {print $5,$6}')

exit $EXIT_CODE
