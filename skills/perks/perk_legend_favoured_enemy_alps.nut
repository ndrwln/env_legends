this.perk_legend_favoured_enemy_alps <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_alps";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyAlps;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyAlps;
		this.m.Icon = "ui/perks/favoured_alps_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteAlps;
		this.m.BraveryMult = 1.5;
	}

});

