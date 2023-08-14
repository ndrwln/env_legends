this.free_company_abstract <- this.inherit("scripts/entity/tactical/human", {
	m = {
		Outfits = [],
		PerkList = [],
		PerkPower = 5
	},
	function assignRandomEquipment()
	{
		foreach( item in this.Const.World.Common.pickOutfit(this.m.Outfits) )
		{
			this.m.Items.equip(item);
		}

		foreach( perk in this.Const.World.Common.pickPerks(this.m.PerkList, this.m.PerkPower) )
		{
			this.m.Skills.add(perk);
		}
	}

});

