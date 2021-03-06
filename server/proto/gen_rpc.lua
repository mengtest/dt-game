#!/usr/bin/env lua
-- test with protoc 2.6.1 & pbc Lua 5.3/5.1

local fmt_str = [[
-- this file is generated by protoc plugin, do not edit!

local rpc_dict = {
%s
}
local req_dict = {
%s
}
local res_dict = {
%s
}

return {
    rpc_dict = rpc_dict,
    req_dict = req_dict,
    res_dict = res_dict,
}
]]

-- service扩展属性

local function fx(methods)
    local mtd_map, req_map, res_map = {}, {}, {}

    for i, method in ipairs(methods) do
        local rpcid = method.rpcid
        local mf = '    %s = %d,\n'
        table.insert(mtd_map, mf:format(method.name, rpcid))

        local q, s = req_map, res_map
        if method.is_s2c then
            q, s = res_map, req_map
        end

        local eq = '    [%3d] = "%s",\n'
        table.insert(q, eq:format(rpcid, method.input_type:sub(2)))
        table.insert(s, eq:format(rpcid, method.output_type:sub(2)))
    end

    local a = table.concat(mtd_map)
    local b = table.concat(req_map)
    local c = table.concat(res_map)
    return fmt_str:format(a, b, c)
end

local function compiler_plugin_main()
    package.cpath = '../luaclib/?.so;' .. package.cpath
    local pb = require 'protobuf'
    pb.register(io.open('google.pb', 'rb'):read('*a'))

    local req_type = 'google.protobuf.compiler.CodeGeneratorRequest'
    local request = pb.decode(req_type, io.input():read('*a'))

    local methods = {}
    local rpcids, names = {}, {}
    for i, v in ipairs(request.proto_file) do
        for _, service in ipairs(v.service) do
            local is_s2c = false
            if service.name:upper():match('^S2C') then
                is_s2c  = true
            end
            for _, method in ipairs(service.method) do
                method.is_s2c = is_s2c
                local rpcid = method.options.rpcid
                if rpcids[rpcid] then
                  error(table.concat({
                    'Duplicate rpcid(', rpcid, ") ", method.name, " in ", v.name}))
                else
                  rpcids[rpcid] = true
                  method.rpcid = rpcid
                end
                local name = method.name
                if names[name] then
                  error('检测到了重复的方法名！' .. name)
                else
                  names[name] = true
                end
                table.insert(methods, method)
            end
        end
    end

    table.sort(methods, function(a, b) return a.rpcid < b.rpcid end)

    local res_type = 'google.protobuf.compiler.CodeGeneratorResponse'

    local r = { file = { {name = 'rpc_info.lua', content = fx(methods) }}}
    io.output():write(pb.encode(res_type, r))
end

return compiler_plugin_main()
