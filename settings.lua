data:extend({
  {
    type = "string-setting",
    name = "saws-scrap-recipe",
    setting_type = "startup",
    default_value = "space-age",
    allowed_values = { "space-age", "no-ice", "ore-only" },
    order = "a[scrap-recipe]"
  },
  {
    type = "bool-setting",
    name = "saws-demolisher-territories",
    setting_type = "startup",
    default_value = true,
    order = "a[demolisher]-a"
  },
  {
    type = "int-setting",
    name = "saws-demolisher-safe-zone",
    setting_type = "startup",
    default_value = 24,
    minimum_value = 7,
    order = "a[demolisher]-b"
  }
})