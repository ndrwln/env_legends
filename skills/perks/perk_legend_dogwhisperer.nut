this.perk_legend_dogwhisperer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_dogwhisperer";
		this.m.Name = this.Const.Strings.PerkName.LegendDogWhisperer;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDogWhisperer;
		this.m.Icon = "ui/perks/perk_hound.png";
		this.m.IconDisabled = "ui/perks/perk_hound_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

