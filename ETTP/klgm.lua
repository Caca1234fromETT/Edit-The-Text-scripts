--[[
Name: klgm.lua
Author: Leader of the KL Library
Description: Manages the pages associated to the 
             KL Library on tikolu.net/edit/kl
--]]

local storageKey = "klgm"

-- gets /kl/gm content
local gm = getl("kl/gm")
local isBU = gm[3] == "1"

-- run bu with /kl/gm and /klam data
if isBU then
 local BUPages = string.gmatch(gm[5], '([^,]+)')
 for page in BUPages do
  local backup = get("klam/"..page)
  if backup ~= "" then -- prevent erasement
   post(page, backup)
  end
 end
end

-- protect /kl/gm
local newGmText = "KL Library - Management - Staff only, do not edit\nBU"
if gm[3] ~= "1" and gm[3] ~= "0" then
 newGmText = newGmText.."\n0"
 post("storage/"..storageKey, "Date: "..os.date().."\nMsg: klgm page error: BU value is incorrect ("..gm[3]..")\n\n"..get("storage/"..storageKey))
else
 newGmText = newGmText.."\n"..gm[3]
end
if gm[5] ~= nil then
 newGmText = newGmText.."\nTarget\n"..gm[5]
else
 post("storage/"..storageKey, "Date: "..os.date().."\nMsg: klgm page error: Target value is incorrect (nil)\n\n"..get("storage/"..storageKey))
 newGmText = newGmText.."\nTarget\n"
end

post("kl/gm", newGmText)
