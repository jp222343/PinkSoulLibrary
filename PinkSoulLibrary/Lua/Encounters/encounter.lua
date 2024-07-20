-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "Poseur strikes a pose!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"pinkattack"}
wavetimer = 4.0
arenasize = {155, 130}
autolinebreak = true

enemies = {
"poseur"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"pinkattack"}

function EncounterStarting()
	Inventory.AddCustomItems({"Cinnamon Bun", "Rusty Sword"}, {0, 1})
	Inventory.SetInventory({"Cinnamon Bun", "Rusty Sword"})
end



function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }
	
	if nextwaves[1] == "pinkattack" then
		wavetimer = 20.0
		arenasize = {1, 100}
	else
		wavetimer = 4.0
		arenasize = {155, 130}
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
     State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    if ItemID == "CINNAMON BUN" then
		Player.Heal(10)
		BattleDialog({"You ate the Cinnamon Bun and Restored 10 HP!"})
	elseif ItemID == "RUSTY SWORD" then
		Inventory.SetAmount(10)
		BattleDialog({"You equipped the Rusty Sword and gained 10 ATK!"}) 
	end
end