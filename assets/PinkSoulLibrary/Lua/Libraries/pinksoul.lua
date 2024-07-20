-- pinksoul.lua
-- By jp222343
-- Feel free to edit and improve it!
-- Credits to u/Kayakazan for making this Library first

-- ✍️ If you want to edit the letters, you'll also have to make the sprites. But don't worry, i left the entire font in the 'Sprites' folder.
-- The letter sprite image size has to be 50x50.

local PinkSoulLibrary = {}


function PinkSoulLibrary.PinkSoul(mainy, lettery, maxrandomspeed, delay)
    mainy = mainy or 70
    lettery = lettery or 200
    maxrandomspeed = maxrandomspeed or 3
    delay = delay or 50

    local wavetimer = 0
    local time = 0
    local taime = 0
    local mainbullet = CreateProjectile('mainbullet', 0, 0)
    mainbullet.MoveTo(0, mainy)
    local mask = CreateProjectile('pink', 0, 0)
    mask.sprite.yscale = 1.2
    mask.SetVar('ignore', true)


    local letters = {"letter_d", "letter_f", "letter_j", "letter_k"} -- The sprites that are going to be used
    local bullets = {}

   -- Change these to the keys you are going to be using. (1)
    local keyPressed = {
        ["D"] = false,
        ["F"] = false,
        ["J"] = false,
        ["K"] = false
    }

      -- Change these to the keys you are going to be using. (2)
    local function UpdateKeyPresses()
        keyPressed["D"] = Input.GetKey("D")
        keyPressed["F"] = Input.GetKey("F")
        keyPressed["J"] = Input.GetKey("J")
        keyPressed["K"] = Input.GetKey("K")
    end

    local function CreateLetterBullet()
        local letter = letters[math.random(#letters)]
        local bullet = CreateProjectile(letter, 0, lettery)
        bullet.SetVar("speed", math.random(1, maxrandomspeed))
        bullet.SetVar("letter", letter)
        bullet.SetVar("inArea", false)
        table.insert(bullets, bullet)
    end

    function PinkSoulLibrary.Update()
        mask.MoveTo(Player.x, Player.y)
        wavetimer = wavetimer + 1

        UpdateKeyPresses()

        if wavetimer % delay == 0 then
            CreateLetterBullet()
        end

        for i = #bullets, 1, -1 do
            local bullet = bullets[i]
            bullet.Move(0, -bullet.GetVar("speed"))

            if bullet.y <= mainbullet.y + 20 and bullet.y >= mainbullet.y - 20 then
                bullet.SetVar("inArea", true)
            else
                bullet.SetVar("inArea", false)
            end
		
            local oncooldown = false
			-- Change these to the keys you are going to be using. (3)
            if Input.GetKey("D") == 2 or Input.GetKey("J") == 2 or Input.GetKey("J") == 2 or Input.GetKey("K") == 2 then 
                oncooldown = true
                taime = 19
            end

            if taime == 21 then
                oncooldown = false
            end

            local letter = bullet.GetVar("letter")
            if bullet.GetVar("inArea") then
			  -- Change these to the keys you are going to be using. (4) (Last one)
			  -- Also don't forget to change the sprites here too.
                if (letter == "letter_d" and keyPressed["D"] >= 1 and taime > 19) or
                   (letter == "letter_f" and keyPressed["F"] >= 1 and taime > 19) or
                   (letter == "letter_j" and keyPressed["J"] >= 1 and taime > 19) or
                   (letter == "letter_k" and keyPressed["K"] >= 1 and taime > 19) then
                    Audio.PlaySound("menuconfirm.wav", 1)
                    bullet.Remove()
                    table.remove(bullets, i)
                end
            end

            if bullet.y < -Arena.height / 2 then
                bullet.Remove()
                table.remove(bullets, i)
            end
        end

        if time == 10 then
            Player.speed = 0
            Player.MoveTo(0, -100)
        end
        time = time + 1
        taime = taime + 1
    end

    function PinkSoulLibrary.OnHit(bullet)
        if bullet ~= mask then
            Player.Hurt(5)
        end
    end

    return PinkSoulLibrary
end

return PinkSoulLibrary

