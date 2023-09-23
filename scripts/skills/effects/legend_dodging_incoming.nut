this.legend_dodging_incoming <- this.inherit("scripts/skills/effects/legend_commander_abstract_effect", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_dodging_incoming";
		this.m.Name = "Dodging incoming projectiles";
		this.m.Description = "This mercenary has recived clear instructions to seek cover, and is coordinating accordingly.";
		this.m.Icon = "ui/perks/incoming_circle.png";
		this.m.IconMini = "mini_incoming_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onUpdate( _properties )
	{
		_properties.RangedSkill += 5;
		_properties.Bravery += 5;
		_properties.RangedDefense += 10;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Ranged Skill"
		});
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve"
		});
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Ranged Defence"
		});
		return ret;
	}

});

