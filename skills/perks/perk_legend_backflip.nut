this.perk_legend_backflip <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_backflip";
		this.m.Name = this.Const.Strings.PerkName.LegendBackflip;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBackflip;
		this.m.Icon = "ui/perks/backflip_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

