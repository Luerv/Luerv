processname = "RobloxPlayerBeta"

running = true
Time = 0

function wait(n)
    if n > 0 then os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") end
end

repeat

    wait(0.75)

    filedata = io.popen("tasklist /NH /FO CSV /FI \"IMAGENAME eq "..processname..".exe".."\"")
output = filedata:read()
filedata:close()

if output ~= "INFO: No tasks are running which match the specified criteria." then
    -- Program is running. Close the program
    Time = Time + 1
    print("Is Running")
    print(Time)
else
    -- Program is not running
    running = false
    print("Isnt Running")
end
    
until running == false

local DataFile = io.open("Data_"..processname..".txt", "r")
io.input(DataFile)

if DataFile == "" or DataFile == nil then
    
    local Write = io.open("Data_"..processname..".txt", "w+")
    local WDataFile = Write:write(tostring(Time))

    local Write2 = io.open("_"..processname..".txt", "w+")

    local Seconds = Time
    local Minutes = 0
    local Hours = 0

    repeat

        if Seconds >= 60 then
            
            Minutes = Minutes + 1

        end
        
    until Seconds < 60

    repeat

        if Minutes >= 60 then
            
            Hours = Hours + 1

        end
        
    until Minutes < 60

    local WDataFile2 = Write2:write(processname.."\n".."\n".."".."Hours    "..Hours.."\n".."Minutes  "..Minutes.."\n".."Seconds  "..Seconds)

else
    
local Data = io.read()
Data = tonumber(Data) + Time
io.close(DataFile)
local Write = io.open("Data_"..processname..".txt", "w+")
local WDataFile = Write:write(tostring(Data))

local Write2 = io.open("_"..processname..".txt", "w+")

local Seconds = Data
local Minutes = 0
local Hours = 0

repeat

    if Seconds >= 60 then
        
        Minutes = Minutes + 1
        Seconds = Seconds - 60

    end
    
until Seconds < 60

repeat

    if Minutes >= 60 then
        
        Hours = Hours + 1
        Minutes = Minutes - 60

    end
    
until Minutes < 60

local WDataFile2 = Write2:write(processname.."\n".."\n".."".."Hours    "..Hours.."\n".."Minutes  "..Minutes.."\n".."Seconds  "..Seconds)

end 
