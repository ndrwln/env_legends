this.brain_damage_injury <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.brain_damage";
		this.m.Name = "Brain Damage";
		this.m.Description = "A hard hit to the head shook some things up and didn\'t exactly benefit this character\'s cognitive skills. On the bright side, he may now be just too stupid to realize when it\'s time to run.";
		this.m.Icon = "ui/injury/injury_permanent_icon_12.png";
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
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] Resolve"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] Experience Gain"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] Initiative"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.BraveryMult *= 1.15;
		_properties.XPGainMult *= 0.75;
		_properties.InitiativeMult *= 0.75;
	}

	function onApplyAppearance()
	{
		local sprite = this.getContainer().getActor().getSprite("permanent_injury_1");
		sprite.setBrush("permanent_injury_01");
		sprite.Visible = true;
	}

});

