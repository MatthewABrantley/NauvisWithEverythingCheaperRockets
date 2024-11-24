local handler = require("event_handler")

-- Force the use of silo-script regardless of Space Age mod
handler.add_lib(require("silo-script"))
script.on_init(function()
    local info =
    {
        image_path = is_space_age and "victory-space-age.png" or "victory.png",
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
end)