this.perk_legend_favoured_enemy_zombie <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_zombie";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyZombie;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyZombie;
		this.m.Icon = "ui/perks/favoured_zombie_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteZombies;
	}

});

