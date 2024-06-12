function start_my_scripts()
	thread.run(test_cycle, "Run salt fog with 10 sec test cycles")
end

function eight_hour_cycle()
    while true do
        ON(1)        --Fogger on
        LOG"Fogger on"
        DISPLAY"Fogger on"
        delay(28800) --Fogger on for eight hours

        OFF(1)       --Fogger off
        LOG"Fogger off"

        ON(2)        --Dehumidifier on
        LOG"Dehumidifier on"
        DISPLAY"Dehumidifier on"
        delay(900)   --Wait 15 minutes

        ON(3)        --Thermocouple on
        LOG"Thermocouple heating"
        DISPLAY"thermocouple warming up"
        delay(2700)  --Wait 45 minutes while thermocouple heats up 

        LOG"Thermocouple done warming up"
        DISPLAY"Thermocouple heating"
        delay(28800) --Wait 8 hours while heat and dehumidifer is on

        OFF(23)
        LOG"Entering 8 hour cool down"
        DISPLAY"8 hour break"
        delay(28800) --Wait 8 hours while nothing is on
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