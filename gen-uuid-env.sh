#!/bin/bash

sed "s/ \# generate new for each var.*uuidgenerator.*/`cat /proc/sys/kernel/random/uuid`/g" .env.template > .env
