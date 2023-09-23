this.perk_legend_specialist_shield_push <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_shield_push";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistShieldPush;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistShieldPush;
		this.m.Icon = "ui/perks/perk_05.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInShieldPush = true;
	}

});

