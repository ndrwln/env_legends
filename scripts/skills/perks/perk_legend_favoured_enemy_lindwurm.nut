this.perk_legend_favoured_enemy_lindwurm <- this.inherit("scripts/skills/legend_favoured_enemy_skill", {
	m = {},
	function create()
	{
		this.legend_favoured_enemy_skill.create();
		this.m.ID = "perk.legend_favoured_enemy_lindwurm";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyLindwurm;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyLindwurm;
		this.m.Icon = "ui/perks/favoured_lindwurm_01.png";
		this.m.ValidTypes = this.Const.LegendMod.FavoriteLindwurm;
	}

});

