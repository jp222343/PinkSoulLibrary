-- Pink Soul remake
-- Example attack
-- By: jp222343 Credits to u/Kayakazan

-- ✍️ If you want to edit the letters, you'll also have to make the sprites. But don't worry, i left the entire font in the 'Sprites' folder.
-- The letter sprite image size has to be 50x50.


-- Arena.ResizeImmediate(20, 100) ⚠️USE THIS IF YOU DIDN'T SET THE arenasize IN THE encounter.lua FILE

local PinkSoulLibrary = require("Libraries/pinksoul")


-- Here is where you call the attack | Parameters: mainy, lettery, maxrandomspeed, delay
-- They're all explained in <https://github.com/jp222343/PinkSoulLibrary>, but if you don't want to use them you can leave it blank and the Library will set the default values.
PinkSoulLibrary.PinkSoul() -- Parameters: mainy, lettery, maxrandomspeed, delay

-- DO NOT Remove this. If you need to use the Update() function, just add your code under the 'PinkSoulLibrary.Update()' line.
function Update()
    PinkSoulLibrary.Update()
end

-- DO NOT Remove this. If you need to use the OnHit() function, just add your code under the 'PinkSoulLibrary.OnHit(bullet)' line.
function OnHit(bullet)
    PinkSoulLibrary.OnHit(bullet)
end

-- This library's idea is not mine, i just recreated it ;) 