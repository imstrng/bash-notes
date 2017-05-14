#!/bin/bash




timeout 1 bash -c '>/dev/tcp/googlde.com/80' &&  echo ja || echo nee
