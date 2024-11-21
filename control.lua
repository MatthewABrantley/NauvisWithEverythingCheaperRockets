local handler = require("event_handler")

-- Force the use of silo-script regardless of Space Age mod
handler.add_lib(require("silo-script"))

-- script.on_configuration_changed(function(data)
--     override_ending_info()
--   game.print("x")
-- end)
-- script.on_init(function(data)
--     override_ending_info()
--   game.print("x")
-- end)
-- -- Override init_ending_info to always use the 'victory-message'
-- override_ending_info = function()
--   local info = {
--     image_path = "victory.png", -- You can still use the Space Age victory image or override it too.
--     title = {"gui-game-finished.victory"},
--     message = {"victory-message"},  -- Always use victory-message
--     bullet_points = {
--       {"victory-bullet-point-1"},
--       {"victory-bullet-point-2"},
--       {"victory-bullet-point-3"},
--       {"victory-bullet-point-4"}
--     },
--     final_message = {"victory-final-message"},
--   }
--   game.set_win_ending_info(info)
--   game.print("changed win condition")
-- end