this.perk_legend_summon_catapult <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_summon_catapult";
		this.m.Name = this.Const.Strings.PerkName.LegendSummonCatapult;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSummonCatapult;
		this.m.Icon = "ui/perks/catapult_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

