this.perk_legend_mastery_staves <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mastery_staves";
		this.m.Name = this.Const.Strings.PerkName.LegendMasteryStaves;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMasteryStaves;
		this.m.Icon = "ui/perks/staffmastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInStaves = true;
	}

});

