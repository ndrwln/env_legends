this.perk_legend_favoured_enemy_ork <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_ork";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyOrk;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyOrk;
		this.m.Icon = "ui/perks/favoured_ork_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteOrc;
	}

});

