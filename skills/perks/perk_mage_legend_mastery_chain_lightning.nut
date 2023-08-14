this.perk_mage_legend_mastery_chain_lightning <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_mastery_chain_lightning";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMasteryChainLightning;
		this.m.Description = this.Const.Strings.PerkDescription.MageLegendMasteryChainLightning;
		this.m.Icon = "ui/perks/lightning_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

