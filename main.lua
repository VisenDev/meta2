local vm = {
    opcodes = {},
    isp = 1,
    stack = {},
    token_buffer = "",
}

function json_stringify(tbl, indent)
    if indent == nil then
        indent = 1
    end
    io.write("{")
    local comma = false
    for key, value in pairs(tbl) do

        if type(value) == "function" then
            error("Cannot stringify function: " .. key)
        end

        if comma then
            io.write(",\n")
        else
            io.write("\n")
        end
        comma = true
        --io.write("\n")
        io.write(string.rep("    ", indent))
        io.write("\"", key, "\"", ": ")
        if type(value) == "table" then
            json_stringify(value, 1 + indent)
        else 
            if type(value) == "string" then
                io.write("\"", tostring(value), "\"")
            else
                io.write(tostring(value))
            end
        end
    end
    if comma then
        io.write("\n")
    end
    io.write("}")
end


json_stringify(vm)
