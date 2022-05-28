dofile(mc_tutorialFramework.path .. "/Tutorials/Punch-A-Block/blocks.lua")

tutorial = {}

tutorial.hud = mhud.init()

function tutorial.blockDestroyed(player)
    tutorial.updateHud(player)
end

function tutorial.startTutorial(player)
    local pmeta = player:get_meta()
    minetest.debug("Started tutorial...")

    --Reset player block break counter
    pmeta:set_int("breakTutorialBlock", 0)

    tutorial.CreateHUD(player)

end

function tutorial.CreateHUD(player)
    local meta = player:get_meta()
    local blocksBroken_text = "Blocks Broken: " .. meta:get_int("breakTutorialBlock")

    tutorial.hud:add(player, "pab:title", {
        hud_elem_type = "text",
        position = { x = 1, y = 0 },
        offset = { x = -6, y = 0 },
        alignment = { x = "left", y = "down" },
        text = "Punch-A-Block Tutorial",
        color = 0x00FF00,
    })

    tutorial.hud:add(player, "pap:stat", {
        hud_elem_type = "text",
        position = { x = 1, y = 0 },
        offset = { x = -6, y = 18 },
        alignment = { x = "left", y = "down" },
        text = blocksBroken_text,
        color = 0x00FF00,
    })


end

function tutorial.updateHud(player)
    local meta = player:get_meta()
    local blocksBroken_text = "Blocks Broken: " .. meta:get_int("breakTutorialBlock")

    tutorial.hud:change(player, "pap:stat", {
        hud_elem_type = "text",
        position = { x = 1, y = 0 },
        offset = { x = -6, y = 18 },
        alignment = { x = "left", y = "down" },
        text = blocksBroken_text,
        color = 0x00FF00,
    })


end

minetest.register_on_joinplayer(function(player)

    tutorial.startTutorial(player)
    return true
end)



