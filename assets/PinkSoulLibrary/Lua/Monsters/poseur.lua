-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Smells like the work\rof an enemy stand.", "Poseur is posing like his\rlife depends on it.", "Poseur's limbs shouldn't be\rmoving in this way."}
commands = {"Apologize", "Pose"}
randomdialogue = {"I dare you to pose better than me!", "If you can't pose, then fight me!", "Haha, how pathetic."}

sprite = "poseur" --Always PNG. Extension is added automatically.
name = "Poseur"
hp = 100
atk = 1
def = 1
check = "Smells like dummy."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

posecounter = 0

SetGlobal("monster_hp", hp)

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "APOLOGIZE" then
		canspare = true
		BattleDialog({"You plead for your life"})
        currentdialogue = {"You've learned your lesson.", "So now i'm sparing you!"}
    elseif command == "POSE" then
		if posecounter == 0 then
			
			canspare = false
			BattleDialog({"You make an awful pose."})
			currentdialogue = {"What? Your posing skills are awful!"}
		elseif posecounter == 1 then
			canspare = false
			BattleDialog({"You make an awful pose."})
			currentdialogue = {"You should stop doing that."}
		else
			canspare = true
			BattleDialog({"You make an awful pose."})
			currentdialogue = {"I will ignore that from now on."}
		end
		posecounter = posecounter + 1
	end
end