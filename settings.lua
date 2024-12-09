data:extend({
  {
    type = "string-setting",
    name = "saws-scrap-recipe",
    setting_type = "startup",
    default_value = "space-age",
    allowed_values = { "space-age", "no-ice", "ore-only" },
    order = "a"
  },
  {
    type = "bool-setting",
    name = "saws-demolisher-territories",
    setting_type = "startup",
    default_value = true,
    order = "b-a"
  },
  {
    type = "int-setting",
    name = "saws-demolisher-safe-zone",
    setting_type = "startup",
    default_value = 24,
    minimum_value = 7,
    order = "b-b"
  },
  {
    type = "bool-setting",
    name = "saws-music-space",
    setting_type = "startup",
    default_value = false,
    order = "c-a"
  },
  {
    type = "bool-setting",
    name = "saws-music-vulcanus",
    setting_type = "startup",
    default_value = false,
    order = "c-b"
  },
  {
    type = "bool-setting",
    name = "saws-music-fulgora",
    setting_type = "startup",
    default_value = false,
    order = "c-c"
  },
  {
    type = "bool-setting",
    name = "saws-music-gleba",
    setting_type = "startup",
    default_value = false,
    order = "c-d"
  },
  {
    type = "bool-setting",
    name = "saws-music-aquilo",
    setting_type = "startup",
    default_value = false,
    order = "c-e"
  },
})