#!/bin/bash

echo "Replacing !!!USER!!! with $USER in index.html"
sed 's/!!!USER!!!/'"$USER"'/g' $ENV0_TEMPLATE_DIR/index.template.html > $ENV0_TEMPLATE_DIR/index.html