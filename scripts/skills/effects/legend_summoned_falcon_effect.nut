this.legend_summoned_falcon_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_summoned_falcon_effect";
		this.m.Name = "Summoned a falcon";
		this.m.Icon = "ui/perks/falcon_circle.png";
		this.m.IconMini = "mini_falcon_circle";
		this.m.Overlay = "falcon_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has summoned a falcon, and may not summon another this combat";
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}

});

