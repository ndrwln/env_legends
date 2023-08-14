this.perk_legend_gatherer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_gatherer";
		this.m.Name = this.Const.Strings.PerkName.LegendGatherer;
		this.m.Description = this.Const.Strings.PerkDescription.LegendGatherer;
		this.m.Icon = "ui/perks/herbs_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

