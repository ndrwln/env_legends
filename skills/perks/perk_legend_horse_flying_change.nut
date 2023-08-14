this.perk_legend_horse_flying_change <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_flying_change";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseFlyingChange;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseFlyingChange;
		this.m.Icon = "ui/perks/clarity_circle.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.ActionPoints += 1;
	}

});

