this.rallied_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.rallied";
		this.m.Name = "Rallied";
		this.m.Description = "You can make the difference! An inspirational leader has rallied this character to gather all his strength and keep on going. A character can only be rallied once per turn and can not rally others when just being rallied himself.";
		this.m.Icon = "skills/status_effect_56.png";
		this.m.IconMini = "status_effect_56_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

});

