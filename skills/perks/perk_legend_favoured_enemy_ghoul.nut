this.perk_legend_favoured_enemy_ghoul <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_ghoul";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyGhoul;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyGhoul;
		this.m.Icon = "ui/perks/favoured_ghoul_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteGhoul;
	}

});

