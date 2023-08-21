this.chilled_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.chilled";
		this.m.Name = "Chilled";
		this.m.Icon = "skills/status_effect_109.png";
		this.m.IconMini = "status_effect_109_mini";
		this.m.Overlay = "status_effect_109";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has been chilled to the bone by cold. With their limbs frozen stiff, it takes a great deal of effort to move in a coordinated fashion. The effect will slowly wear off over [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
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
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + (1 + this.m.TurnsLeft) + "[/color] Action Points"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + (10 + 20 * this.m.TurnsLeft) + "[/color] Initiative"
			}
		];
	}

	function resetTime()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	function onAdded()
	{
		if (this.getContainer().getActor().getCurrentProperties().IsResistantToAnyStatuses && this.Math.rand(1, 100) <= 50)
		{
			if (!this.getContainer().getActor().isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " is unaffected by the cold thanks to his unnatural physiology");
			}

			this.removeSelf();
		}
		else
		{
			this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);

			if (this.getContainer().getActor().hasSprite("dirt"))
			{
				local chilled = this.getContainer().getActor().getSprite("dirt");
				chilled.setBrush("bust_frozen");
				chilled.Visible = true;
			}
		}
	}

	function onRemoved()
	{
		if (this.getContainer().getActor().hasSprite("dirt"))
		{
			local chilled = this.getContainer().getActor().getSprite("dirt");
			chilled.resetBrush();
			chilled.Visible = false;
		}
	}

	function onUpdate( _properties )
	{
		_properties.ActionPoints -= 1 + this.m.TurnsLeft;
		_properties.Initiative -= 10 + 20 * this.m.TurnsLeft;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});

