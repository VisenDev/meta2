local json = dofile("json.lua")

local vm = {
    opcodes = {},
    isp = 1,
    stack = {},
    token_buffer = "",
}

print(json.stringify(vm))
