this.legend_rune_radiance_blueprint <- this.inherit("scripts/crafting/legend_rune", {
	m = {},
	function create()
	{
		this.m.Rune = 32;
		this.m.Skill = "perk.legend_vala_inscribe_shield";
		this.legend_rune.create();
		this.m.ID = "blueprint.legend_rune_radiance";
		this.m.Type = this.Const.Items.ItemType.Misc;
	}

});

