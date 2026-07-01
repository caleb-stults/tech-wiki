#!/bin/bash

MSG="${1:-Update wiki}"

echo "--- Committing changes ---"
git add .
git commit -m "$MSG"
git push origin main

echo "--- Changes pushed via SSH ---"