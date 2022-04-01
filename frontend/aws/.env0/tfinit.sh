#!/bin/bash

echo "Replacing !!!USER!!! with $USER in index.html"
sed 's/!!!USER!!!/'"$USER"'/g' index.template.html > index.html