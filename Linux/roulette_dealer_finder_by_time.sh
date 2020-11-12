#!/bin/bash
grep -i "$1" *$2* | awk -F' ' '{print $1, $2, $5, $6}'
