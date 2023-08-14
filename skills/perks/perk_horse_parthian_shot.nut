this.perk_horse_parthian_shot <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_parthian_shot";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseParthianShot;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseParthianShot;
		this.m.Icon = "ui/perks/perk_08.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.RangedSkillMult *= 1.25;
	}

});

