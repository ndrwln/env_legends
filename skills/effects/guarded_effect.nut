this.guarded_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.guarded_effect";
		this.m.Name = "Guarded";
		this.m.Description = "This character is being protected and is less likely to get attacked over other potential targets.";
		this.m.Icon = "ui/perks/perk_38.png";
		this.m.IconMini = "perk_38_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 0.75;
	}

});

