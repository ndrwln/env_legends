this.perk_legend_favoured_enemy_unhold <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_unhold";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyUnhold;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyUnhold;
		this.m.Icon = "ui/perks/favoured_unhold_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteUnhold;
	}

});

