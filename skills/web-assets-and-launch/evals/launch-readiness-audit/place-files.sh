#!/usr/bin/env bash
set -eu
cp -R "$(dirname "$0")/files/." .
mkdir -p images
ffmpeg -loglevel error -y -f lavfi -i "testsrc2=size=3200x2000" -frames:v 1 images/hero.png
ffmpeg -loglevel error -y -f lavfi -i "mandelbrot=size=1600x1600" -frames:v 1 images/thali.png
git init -q
git add -A
git -c user.name=owner -c user.email=owner@example.com commit -q -m "First version of the site"
