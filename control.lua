local handler = require("event_handler")
handler.add_lib(require("silo-script"))

local init_ending_info = function()
  local info =
  {
    image_path = "victory.png",
    title = {"gui-game-finished.victory"},
    message = {"victory-message"},
    bullet_points =
    {
      {"victory-bullet-point-1"},
      {"victory-bullet-point-2"},
      {"victory-bullet-point-3"},
      {"victory-bullet-point-4"}
    },
    final_message = {"victory-final-message"},
  }
  game.set_win_ending_info(info)
end

local re_add_silo_script = {}

re_add_silo_script.on_configuration_changed = function()
  init_ending_info()
end

re_add_silo_script.on_init = function()
  init_ending_info()
end

handler.add_lib(re_add_silo_script)
