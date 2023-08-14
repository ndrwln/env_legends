this.perk_mage_legend_mastery_magic_missile_mastery <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_mastery_magic_missile_mastery";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMasteryMagicMissileMastery;
		this.m.Description = this.Const.Strings.PerkDescription.MageLegendMasteryMagicMissileMastery;
		this.m.Icon = "ui/perks/missile_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

