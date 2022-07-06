--[[
Name: Save Page as File
Author: Caca1234
Description: Saves the content of a chosen page on Edit The Text as a file
Status: Not tested
--]]

local pageName = "page"

-- save file
local file,err = io.open(pageName:gsub('/','.')..".txt",'w')
if file then
    file:write(tostring(get(pageName)))
    file:close()
else
    print("error: ", err) -- in case
end
