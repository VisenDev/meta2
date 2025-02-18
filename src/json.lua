function stringify(tbl, indent)
    local result = ""
    if indent == nil then
        indent = 1
    end

    result = result .. "{"

    local comma = false
    for key, value in pairs(tbl) do

        if comma then
            result = result .. ","
        end
        comma = true

        result = result .. "\n" .. string.rep("    ", indent) 
        result = result .. "\"" .. key .. "\"" .. ": "
        if type(value) == "table" then
            result = result .. stringify(value, 1 + indent)
        else 
            if type(value) == "number" or type(value) == "boolean" then
                result = result .. tostring(value)
            else
                result = result .. "\"" .. tostring(value) .. "\""
            end
        end
    end
    if comma then
        result = result .. "\n"
    end
    result = result .. "}"
    return result
end

--json_stringify(vm)
return {stringify = stringify}
