this.legend_satiated_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_satiated_effect";
		this.m.Name = "Satiated";
		this.m.Icon = "s";
		this.m.IconMini = "";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.DrugEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has eaten and drunken enough";
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}

});

