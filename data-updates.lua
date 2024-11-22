local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local resource_autoplace = require("resource-autoplace")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

data.raw.planet.nauvis.map_gen_settings.territory_settings = data.raw.planet.vulcanus.map_gen_settings.territory_settings
if mods["base"] == "2.0.20" then
    data.raw["noise-expression"]["demolisher_territory_expression"]["local_expressions"]["starting_area"] = "0 < spot_at_angle{angle = vulcanus_mountains_angle - 5 * vulcanus_starting_direction,\z
                                         distance = 100 * vulcanus_starting_area_radius + 32,\z
                                         radius = 24 * 32,\z
                                         x_distortion = 0,\z
                                         y_distortion = 0}"
else
    data.raw["noise-expression"]["demolisher_starting_area"]["expression"] = "0 < starting_spot_at_angle{angle = vulcanus_mountains_angle - 5 * vulcanus_starting_direction,\z
                                             distance = 100 * vulcanus_starting_area_radius + 32,\z
                                             radius = 24 * 32,\z
                                             x_distortion = 0,\z
                                             y_distortion = 0}"
end
data.raw.planet.vulcanus.map_gen_settings = nil
data.raw.planet.gleba.map_gen_settings = nil
data.raw.planet.fulgora.map_gen_settings = nil
data.raw.planet.aquilo.map_gen_settings = nil

-- data.raw["autoplace-control"].vulcanus_volcanism = nil
-- data.raw["autoplace-control"].gleba_water = nil
-- data.raw["autoplace-control"].fulgora_islands = nil
data.raw["autoplace-control"].vulcanus_coal = nil
data.raw["autoplace-control"].sulfuric_acid_geyser = nil
data.raw["autoplace-control"].gleba_stone = nil
data.raw["autoplace-control"].aquilo_crude_oil = nil
-- data.raw["autoplace-control"].gleba_cliffs = nil
-- data.raw["autoplace-control"].fulgora_cliffs = nil

data.raw.character.character.mining_categories = {"basic-solid", "hard-solid"}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["lithium_brine"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["lithium-brine"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["fluorine_vent"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["fluorine-vent"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["scrap"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["scrap"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["calcite"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["calcite"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["tungsten_ore"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["tungsten-ore"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["gleba_enemy_base"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["gleba_plants"] = {}
data.raw.resource.calcite.autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "calcite",
      order = "c",
      base_density = 0.9,
      base_spots_per_km2 = 1.25,
      has_starting_area_placement = false,
      random_spot_size_minimum = 2,
      random_spot_size_maximum = 4,
      regular_rq_factor_multiplier = 1
    }
data.raw.resource["tungsten-ore"].autoplace =
{
    order = "c",
    has_starting_area_placement = false,
    probability_expression = "vulcanus_tungsten_ore_probability",
    richness_expression = "vulcanus_tungsten_ore_richness"
    }


gleba_land_tiles = {
  "natural-yumako-soil",
  "natural-jellynut-soil",
  "wetland-yumako",
  "wetland-jellynut",
--   "wetland-light-green-slime",
--   "wetland-green-slime",
--   "wetland-pink-tentacle",
--   "wetland-red-tentacle",
  "lowland-brown-blubber",
  "lowland-olive-blubber",
  "lowland-olive-blubber-2",
  "lowland-olive-blubber-3",
  "lowland-cream-red",
  "lowland-red-vein",
  "lowland-red-vein-2",
  "lowland-red-vein-3",
  "lowland-red-vein-4",
  "lowland-red-vein-dead",
  "lowland-red-infection",
--   "lowland-pale-green",
--   "lowland-cream-cauliflower",
--   "lowland-cream-cauliflower-2",
--   "lowland-dead-skin",
--   "lowland-dead-skin-2",
--   "midland-turquoise-bark",
--   "midland-turquoise-bark-2",
--   "midland-cracked-lichen",
--   "midland-cracked-lichen-dull",
--   "midland-cracked-lichen-dark",
--   "midland-yellow-crust",
--   "midland-yellow-crust-2",
--   "midland-yellow-crust-3",
--   "midland-yellow-crust-4",
--   "highland-dark-rock",
--   "highland-dark-rock-2",
--   "highland-yellow-rock",
--   "pit-rock",
--   "wetland-blue-slime",
--   "wetland-light-dead-skin",
--   "wetland-dead-skin",
--   "gleba-deep-lake",
--   "snow-flat",
--   "snow-crests",
--   "snow-lumpy",
--   "snow-patchy",
--   "ice-rough",
--   "ice-smooth",
--   "brash-ice"
}
for _, tile_name in ipairs(gleba_land_tiles) do
  data.raw.planet.nauvis.map_gen_settings.autoplace_settings["tile"].settings[tile_name] = {}
end
data.raw.planet.nauvis.map_gen_settings.autoplace_settings["tile"].settings["ammoniacal-ocean"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings["tile"].settings["ammoniacal-ocean-2"] = {}

data.raw.tile["ammoniacal-ocean"].autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "ammoniacal-ocean",
      order = "a",
      base_density = 8.2,
      base_spots_per_km2 = 0.15,
      random_probability = 1,
      random_spot_size_minimum = 0.3,
      random_spot_size_maximum = 1, -- don't randomize spot size
--       additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
      has_starting_area_placement = false,
    }
data.raw.tile["ammoniacal-ocean-2"].autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "ammoniacal-ocean-2",
      order = "a",
      base_density = 8.3,
      base_spots_per_km2 = 0.15,
      random_probability = 1,
      random_spot_size_minimum = 0.3,
      random_spot_size_maximum = 1, -- don't randomize spot size
      has_starting_area_placement = false,
    }


data.raw.tree["cuttlepop"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["sunnycomb"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["slipstack"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["funneltrunk"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["hairyclubnub"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["teflilly"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["lickmaw"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["stingfrond"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["boompuff"].autoplace["tile_restriction"] = gleba_land_tiles
data.raw.tree["water-cane"].autoplace["tile_restriction"] = gleba_land_tiles

data.raw.technology["space-science-pack"].localised_description = {"technology-description.space-science-pack"}

data.raw["rocket-silo"]["rocket-silo"].launch_to_space_platforms = false
data.raw["rocket-silo"]["rocket-silo"].to_be_inserted_to_rocket_inventory_size = 1
data.raw["rocket-silo"]["rocket-silo"].logistic_trash_inventory_size = 0
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].inventory_size = 0


data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 100
data.raw.technology["rocket-silo"].effects =     {
      {
        type = "unlock-recipe",
        recipe = "rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-part"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-landing-pad"
      },
      {
        type = "unlock-recipe",
        recipe = "satellite"
      }
    }
data.raw.recipe["rocket-silo"].ingredients =
{
      {type = "item", name = "lithium-plate", amount = 1000},
      {type = "item", name = "refined-concrete", amount = 1000},
      {type = "item", name = "pipe", amount = 100},
      {type = "item", name = "quantum-processor", amount = 200},
      {type = "item", name = "electric-engine-unit", amount = 200}
}
data.raw.recipe["rocket-part"].ingredients =
{
  {type = "item", name = "quantum-processor", amount = 10},
  {type = "item", name = "low-density-structure", amount = 10},
  {type = "item", name = "rocket-fuel", amount = 10}
}
data.raw.technology["rocket-silo"].prerequisites = {"quantum-processor"}
data.raw.technology["rocket-silo"].unit.ingredients =
{
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1}
}
data.raw["rocket-silo"]["rocket-silo"].circuit_connector = nil
data.raw["rocket-silo"]["rocket-silo"].circuit_wire_max_distance = nil
data.raw.technology["space-science-pack"] = nil
data:extend({
      {
    type = "technology",
    name = "space-science-pack",
    icon = "__base__/graphics/technology/space-science-pack.png",
    icon_size = 256,
    essential = true,
    effects = {},
    research_trigger =
    {
      type = "send-item-to-orbit",
      item = "satellite"
    },
    prerequisites = {"rocket-silo"}
  },
  {
    type = "item",
    name = "satellite",
    icon = "__base__/graphics/icons/satellite.png",
    subgroup = "space-related",
    order = "d[rocket-parts]-e[satellite]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    stack_size = 1,
    weight = 1 * tons,
    rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 1000}},
    send_to_orbit_mode = "automated"
  },
    {
    type = "recipe",
    name = "satellite",
    energy_required = 5,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "low-density-structure", amount = 100},
      {type = "item", name = "solar-panel", amount = 100},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "radar", amount = 5},
      {type = "item", name = "quantum-processor", amount = 100},
      {type = "item", name = "rocket-fuel", amount = 50},
      {type = "item", name = "biter-egg", amount = 1000}
    },
    results = {{type="item", name="satellite", amount=1}},
    requester_paste_multiplier = 1
  }

})


data.raw.technology["agricultural-science-pack"].prerequisites = {"bioflux"}
data.raw.technology["agricultural-science-pack"].research_trigger = nil
data.raw.technology["agricultural-science-pack"].unit = {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
}
data.raw.technology["metallurgic-science-pack"].research_trigger = nil
data.raw.technology["metallurgic-science-pack"].unit = {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
}
data.raw.technology["electromagnetic-science-pack"].research_trigger = nil
data.raw.technology["electromagnetic-science-pack"].unit = {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
}
data.raw.technology["cryogenic-science-pack"].research_trigger = nil
data.raw.technology["cryogenic-science-pack"].unit = {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60
}

data.raw.technology["lithium-processing"].effects = {
          {
        type = "unlock-recipe",
        recipe = "ammoniacal-solution-separation",
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-ammonia"
      },
      {
        type = "unlock-recipe",
        recipe = "ammonia-rocket-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "ice-platform",
      },
      {
        type = "unlock-recipe",
        recipe = "lithium"
      },
      {
        type = "unlock-recipe",
        recipe = "lithium-plate"
      }
  }
for _, tech in pairs(data.raw.technology) do
  if tech.unit and tech.unit.ingredients then
    for i = #tech.unit.ingredients, 1, -1 do
      if tech.unit.ingredients[i][1] == "space-science-pack" then
        table.remove(tech.unit.ingredients, i)
      elseif tech.unit.ingredients[i][1] == "promethium-science-pack" then
        tech.unit.ingredients[i][1] = "space-science-pack"
      end
    end
  end

  if tech.prerequisites then
    for i = #tech.prerequisites, 1, -1 do
      if tech.prerequisites[i] == "space-science-pack" then
        table.remove(tech.prerequisites, i)
      elseif tech.prerequisites[i] == "promethium-science-pack" then
        tech.prerequisites[i] = "space-science-pack"
      end
    end
  end
end
data.raw.technology["space-platform"] = nil
data.raw.technology["space-platform-thruster"] = nil
data.raw.technology["planet-discovery-vulcanus"] = nil
data.raw.technology["planet-discovery-gleba"] = nil
data.raw.technology["planet-discovery-fulgora"] = nil
data.raw.technology["planet-discovery-aquilo"] = nil
data.raw.technology["lightning-collector"] = nil
data.raw.technology["rail-support-foundations"] = nil
data.raw.technology["asteroid-reprocessing"] = nil
data.raw.technology["advanced-asteroid-processing"] = nil
data.raw.technology["promethium-science-pack"] = nil
data.raw.technology["asteroid-productivity"] = nil
  local inputs = data.raw.lab["lab"].inputs
  -- Iterate through the inputs table to find and remove "promethium-science-pack"
  for i = #inputs, 1, -1 do
    if inputs[i] == "space-science-pack" then
      table.remove(inputs, i)
    end
    if inputs[i] == "promethium-science-pack" then
      inputs[i] = "space-science-pack"
    end
  end
data.raw.lab.biolab.inputs = data.raw.lab["lab"].inputs
local scrap_recipe_setting = settings.startup["scrap-recipe"].value

if scrap_recipe_setting == "no-ice" then
    data.raw.recipe["scrap-recycling"].results =
        {
          {type = "item", name = "processing-unit",        amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
          {type = "item", name = "advanced-circuit",       amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
          {type = "item", name = "low-density-structure",  amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
          {type = "item", name = "solid-fuel",             amount = 1, probability = 0.07, show_details_in_recipe_tooltip = false},
          {type = "item", name = "steel-plate",            amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
          {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
          {type = "item", name = "battery",                amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
          {type = "item", name = "stone",                  amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
          {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
          {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "copper-cable",           amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false}
        }
-- elseif scrap_recipe_setting == "nerfed" then
--     data.raw.recipe["scrap-recycling"].results =
--         {
--           {type = "item", name = "selector-combinator",    amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "electronic-circuit",     amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "coal",                   amount = 1, probability = 0.07, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "barrel",                 amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "burner-inserter",        amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "small-lamp",             amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "battery",                amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "stone",                  amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.15, show_details_in_recipe_tooltip = false},
--           {type = "item", name = "copper-cable",           amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false}
--         }
elseif scrap_recipe_setting == "ore-only" then
    data.raw.recipe["scrap-recycling"].results =
        {
          {type = "item", name = "iron-ore",               amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "copper-ore",             amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "coal",                   amount = 1, probability = 0.10, show_details_in_recipe_tooltip = false},
          {type = "item", name = "stone",                  amount = 1, probability = 0.10, show_details_in_recipe_tooltip = false},
          {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false}
        }
end


for _, item in pairs(data.raw["item"]) do
    item.default_import_location = "nauvis"
end

data.raw.technology.recycling.prerequisites = {"processing-unit", "concrete", "battery"}
data.raw.technology.recycling.research_trigger = nil
data.raw.technology.recycling.unit =
{
      count = 2500,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 15
}

if scrap_recipe_setting == "space-age" then
    table.insert(data.raw.technology.recycling.effects,
    {
      type = "unlock-recipe",
      recipe = "ice-melting",
    })
else
    table.insert(data.raw.technology["lithium-processing"].effects,
    {
      type = "unlock-recipe",
      recipe = "ice-melting",
    })
end

data.raw.technology["foundation"] = nil

data.raw.technology["calcite-processing"].research_trigger = nil
data.raw.technology["calcite-processing"].prerequisites = {"metallurgic-science-pack"}
data.raw.technology["calcite-processing"].unit = {
      count = 500,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "metallurgic-science-pack", 1 }
      },
      time = 15
}
data.raw.technology["rocket-part-productivity"].prerequisites = {"space-science-pack"}
data.raw.technology["rocket-part-productivity"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"cryogenic-science-pack", 1},
        {"space-science-pack", 1}
}
data.raw.technology["tungsten-carbide"].prerequisites = {"lubricant", "concrete", "electric-engine"}
data.raw.technology["tungsten-carbide"].research_trigger = nil
data.raw.technology["tungsten-carbide"].unit =
{
      count = 2500,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 15
}
data.raw.technology.foundry.prerequisites = {"tungsten-carbide"}
data.raw.technology.foundry.effects = {
      {
        type = "unlock-recipe",
        recipe = "foundry"
      },
      {
        type = "unlock-recipe",
        recipe = "concrete-from-molten-iron"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-iron"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-copper"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-iron"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-steel"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-copper"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-iron-gear-wheel"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-iron-stick"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-pipe-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "casting-copper-cable"
      },
    }
table.insert(data.raw.technology["low-density-structure"].effects, {type = "unlock-recipe", recipe = "casting-low-density-structure"})

data.raw.technology["agriculture"].prerequisites = {"chemical-science-pack", "landfill"}
data.raw.technology["agriculture"].research_trigger = nil
data.raw.technology["agriculture"].unit =
{
      count = 1000,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 }
      },
      time = 15
}
data.raw.technology["heating-tower"].prerequisites = {"agricultural-science-pack", "utility-science-pack"}
data.raw.technology["heating-tower"].research_trigger = nil
data.raw.technology["heating-tower"].unit =
{
    count = 250,
    ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "agricultural-science-pack", 1 }
      },
    time = 15
}
data.raw.technology["bacteria-cultivation"].prerequisites = {"agricultural-science-pack", "production-science-pack"}
data.raw.technology["bacteria-cultivation"].research_trigger = nil
data.raw.technology["bacteria-cultivation"].unit =
{
    count = 300,
    ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "agricultural-science-pack", 1 },
      },
    time = 15
}
data.raw.technology["bioflux-processing"].prerequisites = {"agricultural-science-pack", "rocket-fuel"}
data.raw.technology["bioflux-processing"].research_trigger = nil
data.raw.technology["bioflux-processing"].unit =
{
    count = 300,
    ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "agricultural-science-pack", 1 },
      },
    time = 15
}
data.raw.technology["lithium-processing"].prerequisites = {"production-science-pack", "utility-science-pack", "electromagnetic-science-pack", "agricultural-science-pack", "metallurgic-science-pack"}
data.raw.technology["lithium-processing"].research_trigger = nil
data.raw.technology["lithium-processing"].unit =
{
    count = 3000,
    ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "electromagnetic-science-pack", 1 },
        { "agricultural-science-pack", 1 },
        { "metallurgic-science-pack", 1 }
      },
    time = 15
}
data.raw.technology["cryogenic-plant"].prerequisites = {"lithium-processing"}
data.raw.technology["logistic-system"].prerequisites = {"utility-science-pack", "logistic-robotics"}
data.raw.technology["logistic-system"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"utility-science-pack", 1}
}
data.raw.technology["research-productivity"].prerequisites = {"space-science-pack"}
data.raw.technology["research-productivity"].unit.ingredients =
{
    {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"cryogenic-science-pack", 1},
        {"space-science-pack", 1}
}

data.raw.technology["speed-module-2"].prerequisites = {"speed-module", "processing-unit"}
data.raw.technology["productivity-module-2"].prerequisites = {"productivity-module", "processing-unit"}
data.raw.technology["efficiency-module-2"].prerequisites = {"efficiency-module", "processing-unit"}
data.raw.technology["quality-module-2"].prerequisites = {"quality-module", "processing-unit"}


data.raw.technology["kovarex-enrichment-process"].prerequisites = {"uranium-processing", "production-science-pack", "rocket-fuel"}
data.raw.technology["kovarex-enrichment-process"].unit =
{
  count = 1500,
  ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1}
  },
  time = 30
}
data.raw.tool["space-science-pack"].stack_size = 2000

data.raw["cargo-landing-pad"]["cargo-landing-pad"].trash_inventory_size = nil
data.raw["cargo-landing-pad"]["cargo-landing-pad"].cargo_station_parameters =
    {
      hatch_definitions =
      {
        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3),

        planet_upper_hatch({0.5, -3.5},  2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_1),
        planet_upper_hatch({2, -3.5},    2.25, 3, -0.5, procession_graphic_catalogue_types.planet_hatch_emission_in_2),
        planet_upper_hatch({1.25, -2.5}, 1.25, 3, -1  , procession_graphic_catalogue_types.planet_hatch_emission_in_3)
      },
      giga_hatch_definitions =
      {
        planet_upper_giga_hatch({0,1,2, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29})
      }
    }

local tips_and_tricks = {
    "fulgora-briefing",
    "gleba-briefing",
    "vulcanus-briefing",
    "aquilo-briefing",
}

for _, name in pairs(tips_and_tricks) do
    if data.raw["tips-and-tricks-item"][name] then
        data.raw["tips-and-tricks-item"][name] = nil
    end
end
main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
main_menu_simulations.nauvis_artillery = nil
main_menu_simulations.nauvis_oil_refinery = nil
main_menu_simulations.train_junction = nil
main_menu_simulations.nauvis_train_station = nil
main_menu_simulations.nauvis_train_junction = nil
main_menu_simulations.platform_science = nil
main_menu_simulations.platform_moving = nil
main_menu_simulations.platform_messy_nuclear = nil
main_menu_simulations.vulcanus_lava_forge = nil
main_menu_simulations.vulcanus_crossing = nil
main_menu_simulations.vulcanus_punishmnent = nil
main_menu_simulations.vulcanus_sulfur_drop = nil
main_menu_simulations.gleba_agri_towers = nil
main_menu_simulations.gleba_pentapod_ponds = nil
main_menu_simulations.gleba_egg_escape = nil
main_menu_simulations.gleba_farm_attack = nil
main_menu_simulations.gleba_grotto = nil
main_menu_simulations.fulgora_city_crossing = nil
main_menu_simulations.fulgora_recycling_hell = nil
main_menu_simulations.fulgora_nightfall = nil
main_menu_simulations.fulgora_race = nil
main_menu_simulations.aquilo_send_help = nil
main_menu_simulations.aquilo_starter = nil