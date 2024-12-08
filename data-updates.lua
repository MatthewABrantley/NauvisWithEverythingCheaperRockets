local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local resource_autoplace = require("resource-autoplace")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local demolisher_territories = settings.startup["saws-demolisher-territories"].value
if demolisher_territories then
    local demolisher_safe_zone = settings.startup["saws-demolisher-safe-zone"].value
    data.raw.planet.nauvis.map_gen_settings.territory_settings = data.raw.planet.vulcanus.map_gen_settings.territory_settings


    data.raw["noise-expression"]["demolisher_starting_area"]["expression"] = "0 < starting_spot_at_angle{angle = vulcanus_mountains_angle - 5 * vulcanus_starting_direction,\z
                                             distance = 100 * vulcanus_starting_area_radius + 32,\z
                                             radius = ".. demolisher_safe_zone .." * 32,\z
                                             x_distortion = 0,\z
                                             y_distortion = 0}"
    data.raw["noise-expression"]["demolisher_variation_expression"]["expression"] = "floor(clamp((distance - (" .. demolisher_safe_zone - 7 .. " * 32)) / (18 * 32) - 0.25, 0, 4)) + (-99 * no_enemies_mode)"

end

data.raw.planet.vulcanus.map_gen_settings = nil
data.raw.planet.gleba.map_gen_settings = nil
data.raw.planet.fulgora.map_gen_settings = nil
data.raw.planet.aquilo.map_gen_settings = nil

-- data.raw["autoplace-control"].vulcanus_volcanism = nil
-- data.raw["autoplace-control"].gleba_water = nil
-- data.raw["autoplace-control"].fulgora_islands = nil
data.raw["autoplace-control"].vulcanus_coal = nil
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
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["vulcanus_volcanism"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["sulfuric_acid_geyser"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["sulfuric-acid-geyser"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["oil_sand"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["ammoniacal_ocean"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.tile.settings["lava"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.tile.settings["oil-ocean-deep"] = {}
data.raw.planet.nauvis.map_gen_settings.property_expression_names["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability"
data.raw.planet.nauvis.map_gen_settings.property_expression_names["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness"
data.raw.planet.nauvis.map_gen_settings.property_expression_names["entity:calcite:probability"] = "vulcanus_calcite_probability"
data.raw.planet.nauvis.map_gen_settings.property_expression_names["entity:calcite:richness"] = "vulcanus_calcite_richness"
data.raw.planet.nauvis.map_gen_settings.property_expression_names["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability"
data.raw.planet.nauvis.map_gen_settings.property_expression_names["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness"

data.raw["autoplace-control"]["iron-ore"]["can_be_disabled"] = false
data.raw["autoplace-control"]["copper-ore"]["can_be_disabled"] = false
data.raw["autoplace-control"]["stone"]["can_be_disabled"] = false
data.raw["autoplace-control"]["coal"]["can_be_disabled"] = false
data.raw["autoplace-control"]["crude-oil"]["can_be_disabled"] = false
data.raw["autoplace-control"]["calcite"]["can_be_disabled"] = false
data.raw["autoplace-control"]["tungsten_ore"]["can_be_disabled"] = false
data.raw["autoplace-control"]["scrap"]["can_be_disabled"] = false
data.raw["autoplace-control"]["lithium_brine"]["can_be_disabled"] = false
data.raw["autoplace-control"]["fluorine_vent"]["can_be_disabled"] = false
data.raw["autoplace-control"]["vulcanus_volcanism"]["can_be_disabled"] = true
data.raw["autoplace-control"]["vulcanus_volcanism"]["order"] = nil
data.raw["autoplace-control"]["vulcanus_volcanism"]["category"] = "resource"
data:extend({
--     {
--         type = "autoplace-control",
--         name = "demolisher-territories",
--         localised_name = "Demolisher Territories",
--         category = "enemy",
--         richness = false
--     },
    {
        type = "autoplace-control",
        name = "oil_sand",
--         localised_name = "[img=fluid.heavy-oil] Oil Sand",
        category = "resource",
        richness = false
    },
    {
        type = "autoplace-control",
        name = "ammoniacal_ocean",
--         localised_name = "[img=fluid.ammoniacal-solution] Ammoniacal Ocean",
        category = "resource",
        richness = false,
        can_be_disabled = false
    },
})
data.raw.tile["oil-ocean-deep"].autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "oil-ocean",
      order = "a",
      base_density = 7,
      base_spots_per_km2 = 0.02,
      random_probability = 1,
      random_spot_size_minimum = 0.02,
      random_spot_size_maximum = 0.03,
      has_starting_area_placement = false,
      autoplace_control_name = "oil_sand"
    }
data.raw.tile["lava"].autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "lava",
      order = "a",
      base_density = 7,
      base_spots_per_km2 = 0.04,
      random_probability = 1,
      random_spot_size_minimum = 0.2,
      random_spot_size_maximum = 0.7,
      has_starting_area_placement = false,
      autoplace_control_name = "vulcanus_volcanism"
    }
data.raw.tile["lava-hot"].autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "lava",
      order = "a",
      base_density = 7,
      base_spots_per_km2 = 0.01,
      random_probability = 1,
      random_spot_size_minimum = 0.2,
      random_spot_size_maximum = 0.6,
      has_starting_area_placement = false,
      autoplace_control_name = "vulcanus_volcanism"
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
      has_starting_area_placement = false,
      autoplace_control_name = "ammoniacal_ocean"
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
      autoplace_control_name = "ammoniacal_ocean"
    }

nauvis_tiles = {"grass-1", "grass-2", "grass-3", "grass-4", "dry-dirt", "dirt-1", "dirt-2", "dirt-3", "dirt-4", "dirt-5", "dirt-6", "dirt-7", "sand-1", "sand-2", "sand-3", "red-desert-0", "red-desert-1", "red-desert-2", "red-desert-3"}
for _, tile in pairs(nauvis_tiles) do
    table.insert(data.raw.item["overgrowth-yumako-soil"]["place_as_tile"]["tile_condition"], tile)
    table.insert(data.raw.item["overgrowth-jellynut-soil"]["place_as_tile"]["tile_condition"], tile)
end

gleba_trees = {
    "cuttlepop",
    "sunnycomb",
    "slipstack",
    "funneltrunk",
    "hairyclubnub",
    "teflilly",
    "lickmaw",
    "stingfrond",
    "boompuff",
    "water-cane"
    }
for _, tree in ipairs(gleba_trees) do
    if data.raw.tree[tree] then
        if data.raw.tree[tree].autoplace then
            data.raw.tree[tree].autoplace["tile_restriction"] = gleba_land_tiles
        end
    end
end

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
  },

  {
    type = "technology",
    name = "lava-processing",
--     localised_name = "Lava Processing",
--     localised_description = "Enables processing Molten Iron and Molten Copper from Lava.",
    icon = "__space-age__/graphics/icons/fluid/lava.png",
    icon_size = 64,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "molten-iron-from-lava"
      },
      {
        type = "unlock-recipe",
        recipe = "molten-copper-from-lava"
      }
    },
    prerequisites = {"production-science-pack", "metallurgic-science-pack"},
    unit = {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"metallurgic-science-pack", 1}
      },
      time = 30
    }
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
data.raw.technology["asteroid-reprocessing"] = nil
data.raw.technology["advanced-asteroid-processing"] = nil
data.raw.technology["promethium-science-pack"] = nil
data.raw.technology["asteroid-productivity"] = nil

for lab, lab_data in pairs(data.raw.lab) do
    local inputs = lab_data.inputs
    lab_data.inputs = {}
    for i = #inputs, 1, -1 do
        if inputs[i] == "promethium-science-pack" then
            table.insert(lab_data.inputs, "space-science-pack")
        elseif inputs[i] ~= "space-science-pack" then
            table.insert(lab_data.inputs, inputs[i])
        end
    end
end
local scrap_recipe_setting = settings.startup["saws-scrap-recipe"].value

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
-- data.raw.technology["tungsten-carbide"].localised_description = "Allows you to make tungsten carbide, a hard heat resistant ceramic. In Space Age Without Space, your character can mine Tungsten Ore from Tungsten Ore patches."
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

data.raw["create-platform-achievement"] = nil
data.raw["change-surface-achievement"] = nil
data.raw["space-connection-distance-traveled-achievement"] = nil
data.raw["research-with-science-pack-achievement"]["research-with-promethium"] = nil

for _, category in pairs(data.raw) do
    for name, data in pairs(category) do
        if data.surface_conditions then
            data.surface_conditions = nil
        end
    end
end