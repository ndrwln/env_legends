this.double_strike_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.double_strike";
		this.m.Name = "Double Strike!";
		this.m.Icon = "skills/status_effect_doublestrike.png";
		this.m.IconMini = "mini_doublestrike_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Having just landed a hit, this character is ready to perform a powerful follow-up strike! The next attack will inflict [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] damage to a single target. If the attack misses, the effect is wasted.";
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= 1.2;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		this.removeSelf();
	}

});

