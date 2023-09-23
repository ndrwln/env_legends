this.perk_legend_channeled_power <- this.inherit("scripts/skills/skill", {
	m = {
		FatigueMult = 0.7
	},
	function create()
	{
		this.m.ID = "perk.legend_channeled_power";
		this.m.Name = this.Const.Strings.PerkName.LegendChanneledPower;
		this.m.Description = this.Const.Strings.PerkDescription.LegendChanneledPower;
		this.m.Icon = "ui/perks/possess56.png";
		this.m.IconDisabled = "ui/perks/possess56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

