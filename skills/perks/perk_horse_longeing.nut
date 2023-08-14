this.perk_horse_longeing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_longeing";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseLongeing;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseLongeing;
		this.m.Icon = "ui/perks/longeing_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.BraveryMult *= 1.25;
	}

});

