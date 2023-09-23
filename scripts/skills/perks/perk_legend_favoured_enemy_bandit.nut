this.perk_legend_favoured_enemy_bandit <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_bandit";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyBandit;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyBandit;
		this.m.Icon = "ui/perks/favoured_bandit_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteBandit;
	}

});

