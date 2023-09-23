this.legend_demon_hound_bite_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 3
	},
	function create()
	{
		this.m.ID = "effects.legend_demon_hound_bite_effect";
		this.m.Name = "Höllenhund Curse";
		this.m.Description = "This character has been bitten and cursed by a Höllenhund. Fatigue recovery is reduced.";
		this.m.Icon = "skills/demon_hound_bite.png";
		this.m.IconMini = "demon_hound_bite_effect";
		this.m.Overlay = "demon_hound_bite_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.Math.max(1, 3 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	function getDescription()
	{
		return "This character has been bitten by a Höllenhund and has [color=" + this.Const.UI.Color.NegativeValue + "] -30% [/color]Fatigue recovery for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function onUpdate( _properties )
	{
		_properties.FatigueRecoveryRateMult *= 0.3;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function resetTime()
	{
		this.m.TurnsLeft = this.Math.max(1, 3 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

});

