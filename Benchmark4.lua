-- LVMS Benchmark
-- Version 1.0.0
-- Default Iterations: 1M

local ITER = 1000000
local Dump1, Dump2 = 0, 1
local Switch = false
local Start = os.clock()

-- MOVE TEST
-- Very good: 0.1... above
-- Good: 0.5...-0.1
-- Decent: 0.9...-0.5
-- Bad: 5.0-1.0
-- Turtle: any number below 5.0 seconds

local MoveStart = os.clock()
for Idx = 1, ITER do
    if not Switch then
        Dump1 = Dump2
        Switch = true
    else
        Dump2 = Dump1
        Switch = false
    end
end
print("MOVE test took " .. os.clock() - MoveStart)

-- GETTABLE TEST
-- Very good: 1.0-0.5
-- Good: 1.5...-1.0
-- Decent: 3.0-1.5
-- Bad: 5.0-3.0
-- Turtle: any number below 5.0 seconds

Dump1, Dump2 = {}, 1
local GTStart = os.clock()
for Idx = 1, ITER do
    Dump1[tostring(Idx)] = Idx * Dump2
    Dump1.FieldExample = GTStart + Idx - Dump2 + #Dump1
    Dump1.Test = Dump1.FieldExample * Dump1[tostring(Idx)]
end
print("GETTABLE test took " .. os.clock() - GTStart)

-- SETTABLE TEST
-- Very good: 1.0-0.1
-- Good: 2.0-1.0
-- Decent: 5.0-2.0
-- Bad: 10.0-5.0
-- Turtle: any number below 10.0 seconds

local STStart = os.clock()
for Idx = 1, ITER do
    Dump1.Test = tonumber(tostring(Idx) .. tostring(Idx))
    Dump1["Test2"] = Dump1.Test
    Dump1[Idx] = Dump1["Test2"] * Dump1.Test
end
print("SETTABLE test took " .. os.clock() - STStart)

-- LOADK TEST
-- Very good: 0.1 above
-- Good: 0.5-0.1
-- Decent: 1.0-0.5
-- Bad: 2.0-1.0
-- Turtle: any number below 2.0 seconds

Dump1, Dump2 = nil, nil
local LKStart = os.clock()
for Idx = 1, ITER do
    Dump1 = Idx + 0xFF * #"LVMS" - #[=[test]=] / 0 ^ math['pi']
    Dump2 = true and false or Dump1 == {} == {1,2,3} ~= 67
end
print("LOADK test took " .. os.clock() - LKStart)

-- CALL TEST
-- Very good: 0.9-0.1...
-- Good: 1.5-0.9
-- Decent: 3.0-1.5
-- Bad: 5.0-3.0
-- Turtle: any number below 5.0 seconds

local CStart = os.clock()
for Idx = 1, ITER do
    (function(n)
        if type(n) ~= "number" then
            print'lvms'
        end
    end)(Idx)
end
print("CALL & CLOSURE test took " .. os.clock() - CStart)

print("LVMS Benchmark - ITERATIONS: " .. ITER .. " - took " .. os.clock() - Start .. " to finish")