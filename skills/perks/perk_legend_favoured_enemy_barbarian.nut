this.perk_legend_favoured_enemy_barbarian <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_barbarian";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyBarbarian;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyBarbarian;
		this.m.Icon = "ui/perks/favoured_barbarian_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteBarbarian;
	}

});

