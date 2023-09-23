this.perk_mastery_greatsword <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mastery.greatsword";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecGreatSword;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecGreatSword;
		this.m.Icon = "ui/perks/perk_10.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInGreatSwords = true;
	}

});

