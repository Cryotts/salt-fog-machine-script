function start_my_scripts()
	thread.run(eight_hour_cycle, "Run final salt fog script")
end

function eight_hour_cycle()
    local blank=string.rep(" ",ui.column_count)
    cycle = 1
    while true do

        ON(1)        --Fogger on
        LOG"Fogger on"
        hours_left = 8
        while hours_left > 0 do
            DISPLAY "\f"     -- Clear screen
            ui.line[1] = "Fogger on" ..blank
            to_display = "h left=" .. hours_left .. " cyc=" .. cycle
            ui.line[2] = to_display .. blank
            delay (3600)
            hours_left = hours_left - 1
        end
        OFF(1)       --Fogger off
        LOG"Fogger off"


        ON(2)        --Dehumidifier on
        LOG"Dehumidifier on"
        DISPLAY "\f"     -- Clear screen
        ui.line[1] = "DH on"..blank
        ui.line[2] = "15 m, cyc=" .. cycle .. blank
        delay(900)    --dehumidifer for 15 minutes no heat
        
        hours_left=8
        ON(3)        --Thermocouple on
        LOG"TC on"
        while hours_left > 0 do
            DISPLAY "\f"     -- Clear screen
            ui.line[1] = "DH & TC on" .. blank
            to_display = "h left=" .. hours_left .. " cyc=" .. cycle
            ui.line[2] = to_display .. blank
            delay (3600)
            hours_left = hours_left - 1
        end

        OFF(23)
        LOG"Entering 8 hour cool down"
        hours_left = 8

        while hours_left > 0 do
            DISPLAY "\f"     -- Clear screen
            ui.line[1] = "Cool down" .. blank
            to_display = "h left=" .. hours_left .. " cyc=" .. cycle 
            ui.line[2] = to_display .. blank
            delay (3600)
            hours_left = hours_left - 1
        end
        cycle = cycle + 1
    end
end

function test_cycle()
    local blank=string.rep(" ",ui.column_count)
    cycle = 1
    while true do

        ON(1)        --Fogger on
        LOG"Fogger on"
        hours_left = 8
        while hours_left > 0 do
            DISPLAY "\f"     -- Clear screen
            ui.line[1] = "Fogger on" ..blank
            to_display = "h left=" .. hours_left .. " cyc=" .. cycle
            ui.line[2] = to_display .. blank
            delay (10)
            hours_left = hours_left - 1
        end
        OFF(1)       --Fogger off
        LOG"Fogger off"


        ON(2)        --Dehumidifier on
        LOG"Dehumidifier on"
        ui.line[1] = "DH on"..blank
        ui.line[2] = "15 m, cyc=" .. cycle .. blank
        delay(10)    --dehumidifer for 15 minutes no heat
        
        hours_left=8
        ON(3)        --Thermocouple on
        LOG"TC on"
        while hours_left > 0 do
            DISPLAY "\f"     -- Clear screen
            ui.line[1] = "DH & TC on" .. blank
            to_display = "h left=" .. hours_left .. " cyc=" .. cycle
            ui.line[2] = to_display .. blank
            delay (10)
            hours_left = hours_left - 1
        end

        OFF(23)
        LOG"Entering 8 hour cool down"
        hours_left = 8

        while hours_left > 0 do
            DISPLAY "\f"     -- Clear screen
            ui.line[1] = "Cool down" .. blank
            to_display = "h left=" .. hours_left .. " cyc=" .. cycle 
            ui.line[2] = to_display .. blank
            delay (10)
            hours_left = hours_left - 1
        end
        cycle = cycle + 1
    end
end