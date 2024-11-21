-- settings.lua
data:extend({
  {
    type = "string-setting",
    name = "scrap-recipe",  -- The name of your setting
    setting_type = "startup",  -- Can be "startup" for mod startup or "runtime-global" for global settings during the game
    default_value = "space-age",  -- Set the default value (could be "normal", "nerfed", or "buffed" depending on your use case)
    allowed_values = { "space-age", "no-ice", "ore-only" },  -- The list of possible values for the dropdown
    order = "a[scrap-recipe]",  -- The order in the settings menu
--     localised_name = {"settings.scrap-recipe-name"},
--     localised_description = {"settings.scrap-recipe-description"}
  }
})