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
    while true do
        ON(1)        --Fogger on
        LOG"Fogger on"
        DISPLAY"Fogger on"
        delay(10) --Fogger on for eight hours

        OFF(1)       --Fogger off
        LOG"Fogger off"

        ON(2)        --Dehumidifier on
        LOG"Dehumidifier on"
        DISPLAY"Dehumidifier on"
        delay(10)   --Wait 15 minutes

        ON(3)        --Thermocouple on
        LOG"Thermocouple heating"
        DISPLAY"thermocouple warming up"
        delay(10)  --Wait 45 minutes while thermocouple heats up 

        LOG"Thermocouple done warming up"
        DISPLAY"Thermocouple heating"
        delay(10) --Wait 8 hours while heat and dehumidifer is on

        OFF(23)
        LOG"Entering 8 hour cool down"
        DISPLAY"8 hour break"
        delay(10) --Wait 8 hours while nothing is on
    end
end