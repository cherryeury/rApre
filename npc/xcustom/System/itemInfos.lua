	----------------------------------------------------------
------ rathena
------ sader1992
------ https://rathena.org/board/profile/30766-sader1992/
----------------------------------------------------------
function main()
	a = {}
	e = false
	local functions = require("System.function")
	require("System.import_iteminfo")	-- THE Import file name here !!
	for ItemID, DESCS in pairs(tbl) do
		result, msg = AddItem(ItemID, DESCS.unidentifiedDisplayName, DESCS.unidentifiedResourceName, DESCS.identifiedDisplayName, DESCS.identifiedResourceName, DESCS.slotCount, DESCS.ClassNum)
		if not result == true then
			return false, msg
		end
		AddItemUnidentifiedDesc(ItemID, functions.add_custom())
		for k, v in pairs(DESCS.unidentifiedDescriptionName) do
			result, msg = AddItemUnidentifiedDesc(ItemID, v)
			if not result == true then
				return false, msg
			end
		end
		AddItemUnidentifiedDesc(ItemID, functions.add_arena_url(ItemID))
		AddItemIdentifiedDesc(ItemID, functions.add_custom())
		for k, v in pairs(DESCS.identifiedDescriptionName) do
			result, msg = AddItemIdentifiedDesc(ItemID, v)
			if not result == true then
				return false, msg
			end
		end
		AddItemIdentifiedDesc(ItemID, functions.add_arena_url(ItemID))
		if nil ~= DESCS.EffectID then
			result, msg = AddItemEffectInfo(ItemID, DESCS.EffectID)
		end
		if not result == true then
			return false, msg
		end
		if nil ~= DESCS.costume then
			result, msg = AddItemIsCostume(ItemID, DESCS.costume)
		end
		if not result == true then
			return false, msg
		end
		a[#a+1] = ItemID
	end
	require("System.itemInfo_EN")	-- The kro iteminfo file name here !!!
	for ItemID, DESC in pairs(tbl) do
		print(tostring(ItemID))
		for _,v in pairs(a) do
			if v == ItemID then
					e = true
				break
			end
		end
		if not e == true then
			result, msg = AddItem(ItemID, DESC.unidentifiedDisplayName, DESC.unidentifiedResourceName, DESC.identifiedDisplayName, DESC.identifiedResourceName, DESC.slotCount, DESC.ClassNum)
			if not result == true then
				return false, msg
			end
			AddItemUnidentifiedDesc(ItemID, functions.add_clear())
			for k, v in pairs(DESC.unidentifiedDescriptionName) do
				result, msg = AddItemUnidentifiedDesc(ItemID, v)
				if not result == true then
					return false, msg
				end
			end
			AddItemUnidentifiedDesc(ItemID, functions.add_url(ItemID))
			AddItemIdentifiedDesc(ItemID, functions.add_clear())
			for k, v in pairs(DESC.identifiedDescriptionName) do
				result, msg = AddItemIdentifiedDesc(ItemID, v)
				if not result == true then
					return false, msg
				end
			end
			AddItemIdentifiedDesc(ItemID, functions.add_url(ItemID))
			if nil ~= DESC.EffectID then
				result, msg = AddItemEffectInfo(ItemID, DESC.EffectID)
			end
			if not result == true then
				return false, msg
			end
			if nil ~= DESC.costume then
				result, msg = AddItemIsCostume(ItemID, DESC.costume)
			end
			if not result == true then
				return false, msg
			end
		end
		e = false
	end
	return true, "good"
end