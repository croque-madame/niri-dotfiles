// Enable zen transparency
user_pref("zen.widget.linux.transparency", true);
user_pref("zen.view.grey-out-inactive-windows", false);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Fixes stale opaque regions (black boxes)
user_pref("widget.wayland.opaque-region.enabled", false);
user_pref("layers.acceleration.force-enabled", true);
user_pref("gfx.webrender.max-partial-present-rects", 0);
