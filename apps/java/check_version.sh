#!/bin/bash

test -d "$HOME/.sdkman" && source "$HOME/.sdkman/bin/sdkman-init.sh"

if command -v sdk > /dev/null; then
    sdk current java | awk '{print $4}' | xargs
fi