this.perk_legend_favoured_enemy_goblin <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_goblin";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyGoblin;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyGoblin;
		this.m.Icon = "ui/perks/favoured_goblin_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteGoblin;
	}

});

