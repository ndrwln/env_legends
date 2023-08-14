this.perk_legend_conservation <- this.inherit("scripts/skills/skill", {
	m = {
		MedicinePerDayMult = 0.5
	},
	function create()
	{
		this.m.ID = "perk.legend_conservation";
		this.m.Name = this.Const.Strings.PerkName.LegendConservation;
		this.m.Description = this.Const.Strings.PerkDescription.LegendConservation;
		this.m.Icon = "ui/perks/possess56.png";
		this.m.IconDisabled = "ui/perks/possess56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

