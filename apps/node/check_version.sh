#!/bin/bash

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"  # This loads nvm

if command -v nvm > /dev/null; then
    nvm current
fi