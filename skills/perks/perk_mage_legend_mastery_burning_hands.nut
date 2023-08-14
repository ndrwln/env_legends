this.perk_mage_legend_mastery_burning_hands <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_mastery_burning_hands";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMasteryBurningHands;
		this.m.Description = this.Const.Strings.PerkDescription.MageLegendMasteryBurningHands;
		this.m.Icon = "ui/perks/mage_legend_magic_burning_hands_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

