this.perk_legend_herbcraft <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_herbcraft";
		this.m.Name = this.Const.Strings.PerkName.LegendHerbcraft;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHerbcraft;
		this.m.Icon = "ui/perks/herbcraft.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

