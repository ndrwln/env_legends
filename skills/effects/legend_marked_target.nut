this.legend_marked_target <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 3
	},
	function create()
	{
		this.m.ID = "effects.legend_marked_target";
		this.m.Name = "Marked target";
		this.m.Description = "This character has been marked by a skilled opponent, ranged attacks are more likely to hit";
		this.m.Icon = "skills/MarkTargetSkill.png";
		this.m.IconMini = "mini_mark_target";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has is a marked target and has [color=" + this.Const.UI.Color.NegativeValue + "] -20 [/color] ranged defense each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
	}

	function onUpdate( _properties )
	{
		_properties.RangedDefense -= 20;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});

