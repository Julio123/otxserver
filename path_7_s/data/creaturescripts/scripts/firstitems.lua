-- Without Rookgaard
local config = {
	[1] = {
		--equipment spellbook, wand of vortex, studded legs, leather boots, scarf
		items = {{2175, 1}, {2190, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container rope, shovel
		container = {{2120, 1}, {2554, 1}}
	},
	[2] = {
		--equipment spellbook, snakebite rod, studded legs, leather boots scarf
		items = {{2175, 1}, {2182, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container rope, shovel
		container = {{2120, 1}, {2554, 1}}
	},
	[3] = {
		--equipment dwrven shield, 5 spear, ranger's cloak, scarf, legion helmet
		items = {{2525, 1}, {2389, 5}, {2660, 1}, {2643, 1}, {2661, 1}, {2480, 1}},
		--container rope, shovel, bow, 50 arrow
		container = {{2120, 1}, {2554, 1}, {2456, 1}, {2544, 50}}
	},
	[4] = {
		--equipment dwarven shield, orcish axe, brass armor, brass helmet, brass legs scarf
		items = {{2525, 1}, {2428, 1}, {2465, 1}, {2460, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container spike sword, daramian mace, rope, shovel, health potion
		container = {{2383, 1}, {2439, 1}, {2120, 1}, {2554, 1}}
	}
}

function onLogin(player)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end
