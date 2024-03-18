--[[
    Contributors: mAxPower
    License: MIT

    Description:    In ETLegacy stopwatch, teams are unlocked when there is a gamestate change.
                    This script solves this by locking each team using referee commands when there
                    is a start to a round or a gamestate change from pause/unpause.
]]--

local modname = "team-lock"
local version = "1.0"

-- local constants


-- local variables



function et_InitGame(levelTime, randomSeed, restart)
    et.RegisterModname("team-lock")
end

function et_RunFrame(levelTime)
    if et.trap_Cvar_Get("gamestate") == "0" then -- Game is running
        et.trap_SendConsoleCommand(et.EXEC_APPEND, "ref lock r\n")
        et.trap_SendConsoleCommand(et.EXEC_APPEND, "ref lock b\n")
    end
end

function et_ClientCommand(clientNum, command)
    if string.lower(et.trap_Argv(0)) == "unpause" then
        et.trap_SendConsoleCommand(et.EXEC_APPEND, "ref lock r\n")
        et.trap_SendConsoleCommand(et.EXEC_APPEND, "ref lock b\n")
    end
end
