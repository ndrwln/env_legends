this.legend_rune_poison_blueprint <- this.inherit("scripts/crafting/legend_rune", {
	m = {},
	function create()
	{
		this.m.Rune = 4;
		this.m.Skill = "perk.legend_vala_inscribe_weapon";
		this.legend_rune.create();
		this.m.ID = "blueprint.legend_rune_poison";
		this.m.Type = this.Const.Items.ItemType.Misc;
	}

});

