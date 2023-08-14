this.perk_mage_legend_mastery_hailstone <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_mastery_hailstone";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMasteryHailstone;
		this.m.Description = this.Const.Strings.PerkDescription.MageLegendMasteryHailstone;
		this.m.Icon = "ui/perks/mage_legend_magic_hailstone_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

