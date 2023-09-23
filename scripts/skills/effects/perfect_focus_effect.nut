this.perfect_focus_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.perfect_focus";
		this.m.Name = "Perfect Focus";
		this.m.Description = "This character has achieved perfect focus as if time itself were to stand still and can use all skills at half their normal Action Point cost this turn, but at 1.75 times the Fatigue cost.";
		this.m.Icon = "ui/perks/perfectfocus_circle.png";
		this.m.IconMini = "perk_37_mini";
		this.m.Overlay = "perk_37";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getIconDisabled()
	{
		return "FUCKOFF";
	}

	function onUpdate( _properties )
	{
		if (!this.isGarbage())
		{
			_properties.IsSkillUseHalfCost = true;
			_properties.FatigueEffectMult *= 1.75;
		}
	}

	function onTurnStart()
	{
		this.removeSelf();
	}

});

