this.perk_legend_smashing_shields <- this.inherit("scripts/skills/skill", {
	m = {
		Modifier = 2.0
	},
	function create()
	{
		this.m.ID = "perk.legend_smashing_shields";
		this.m.Name = this.Const.Strings.PerkName.LegendSmashingShields;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSmashingShields;
		this.m.Icon = "ui/perks/sunderingstrikes_circle.png";
		this.m.IconDisabled = "ui/perks/sunderingstrikes_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getModifier()
	{
		return this.m.Modifier;
	}

});

