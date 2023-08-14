this.legend_parried_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_parried";
		this.m.Name = "Vulnerable";
		this.m.Description = "This character has overextended, and is now vulnerable to a counterattack.";
		this.m.Icon = "ui/perks/parried_circle.png";
		this.m.IconMini = "mini_parried_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Melee Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Ranged Defense"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense -= 10;
		_properties.RangedDefense -= 10;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

});

