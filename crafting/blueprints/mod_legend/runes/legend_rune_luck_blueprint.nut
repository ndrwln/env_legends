this.legend_rune_luck_blueprint <- this.inherit("scripts/crafting/legend_rune", {
	m = {},
	function create()
	{
		this.m.Rune = 13;
		this.m.Skill = "perk.legend_vala_inscribe_helmet";
		this.legend_rune.create();
		this.m.ID = "blueprint.legend_rune_luck";
		this.m.Type = this.Const.Items.ItemType.Misc;
	}

});

