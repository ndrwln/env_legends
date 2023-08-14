this.perk_legend_favoured_enemy_mercenary <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_mercenary";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyMercenary;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyMercenary;
		this.m.Icon = "ui/perks/favoured_mercenary_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteMercenary;
	}

});

