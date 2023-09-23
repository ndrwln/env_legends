this.perk_legend_favoured_enemy_hexen <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_hexen";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyHexen;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyHexen;
		this.m.Icon = "ui/perks/favoured_hexen_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteHexe;
		this.m.BraveryMult = 1.5;
	}

});

