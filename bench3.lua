local iterations = 10000000
local start = os.clock()

local function benchmark()
    local x = 0
    for i = 1, iterations do
        x = x + math.sin(i) * math.cos(i)
        if x > 100 then x = x / 2 end
    end
    return x
end

print("Result:", benchmark())
print("Time taken: " .. (os.clock() - start) .. "s")

local function factorial(n)
    if n == 0 then return 1 end
    return n * factorial(n - 1)
end

local start = os.clock()
for i = 1, 1000000 do
    local res = factorial(10)
end
print("Recursion Test Finished in: " .. (os.clock() - start) .. "s")


local data = {}
local start = os.clock()

-- Testing Table Insertion and Key Access
for i = 1, 100000 do
    data["key_" .. i] = i * 2
end

local sum = 0
for i = 1, 100000 do
    sum = sum + (data["key_" .. i] or 0)
end

print("Table/String Test Result:", sum)
print("Time taken: " .. (os.clock() - start) .. "s")

