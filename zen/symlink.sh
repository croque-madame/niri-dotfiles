#!/bin/sh
# One-time setup: symlink user.js and matugen's generated Zen CSS into your Zen profile.
# Usage: ./setup-zen-links.sh [path/to/zen/profile]
# With no argument, the default profile is read from ~/.zen/profiles.ini.
set -e

ZEN_ROOT="$HOME/.config/zen"
GEN_DIR="$HOME/.config/zen"
SRC="$ZEN_ROOT/user.js"

if [ -n "$1" ]; then
    profile="$1"
else
    rel=$(awk -F= '/^Default=/ && $2 != "1" {print $2; exit}' "$ZEN_ROOT/profiles.ini")
    [ -n "$rel" ] || {
        echo "Could not detect the profile. Pass it as an argument." >&2
        exit 1
    }
    profile="$ZEN_ROOT/$rel"
fi

[ -d "$profile" ] || {
    echo "Profile not found: $profile" >&2
    exit 1
}

# --- user.js ---------------------------------------------------------------
# Create a starter user.js only if you don't have one yet.
if [ ! -e "$SRC" ]; then
    cat >"$SRC" <<'EOF'
// Enable zen transparency
user_pref("zen.widget.linux.transparency", true);
user_pref("zen.view.grey-out-inactive-windows", false);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// Fixes stale opaque regions (black boxes)
user_pref("widget.wayland.opaque-region.enabled", false);
EOF
    echo "Created $SRC with the transparency prefs"
else
    for pref in zen.widget.linux.transparency toolkit.legacyUserProfileCustomizations.stylesheets; do
        grep -q "$pref" "$SRC" || echo "Note: $SRC doesn't set $pref (needed for the theme)"
    done
fi

ln -sf "$SRC" "$profile/user.js"
echo "Linked $profile/user.js -> $SRC"

# --- chrome CSS ------------------------------------------------------------
mkdir -p "$GEN_DIR" "$profile/chrome"

# Create empty targets so the links aren't dangling before the first matugen run
touch "$GEN_DIR/userChrome.css" "$GEN_DIR/userContent.css"

for f in userChrome.css userContent.css; do
    dest="$profile/chrome/$f"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mv "$dest" "$dest.bak"
        echo "Backed up existing $f to $f.bak"
    fi
    ln -sfn "$GEN_DIR/$f" "$dest"
    echo "Linked $dest -> $GEN_DIR/$f"
done

echo "Done. Run matugen, then restart Zen."
