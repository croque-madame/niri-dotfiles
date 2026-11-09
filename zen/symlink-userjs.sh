#!/bin/sh
set -e
SRC="user.js"

profile=$(awk -F= '/^Default=/ && $2 != "1" {print $2; exit}' "profiles.ini")

ln -sf "$SRC" "$profile/user.js"
echo "Linked to $profile/user.js"
