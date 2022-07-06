--[[
Name: Permanent Page Protection
Author: Caca1234
Description: Continuously overwrites a chosen page on Edit The Text with content.
--]]

local pageName = "page"
local content = [[This page has been seized by the ETTA.
:)
]]

-- always repeat the overwriting after some time
while true do
  post(pageName, content)
  wait(1)
end
