--[[
Name: Semi-automatic Spam
Author: caca1234
Description: selects random pages from a list and prompts the user for text to add to the top of each page
--]]
list = {"roblox", "mc", "mcpe", "quick", "books", "bruv", "string", "seed", "bread", "board", "mother", "father"}
while true do
 local name = list[math.random(1, #list)]
 post(name, input(name).."\n\n"..get(name))
end
