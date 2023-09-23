this.peasant_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.peasant";
		this.m.Name = "Peasant";
		this.m.Icon = "ui/traits/trait_icon_00.png";
		this.m.Description = "This trait is used to alter daily reputation decline for noble factions.";
		this.m.IsHidden = true;
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
				icon = "ui/icons/special.png",
				text = "This trait is used to alter daily reputation decline for noble factions and remove the fear of nobles trait. If you can see this tooltip then something is broken - or someone is fucking with things they shouldn\'t be."
			}
		];
	}

	function onAdded()
	{
		if (this.m.Container.hasSkill("trait.fear_nobles"))
		{
			this.m.Container.removeByID("trait.fear_nobles");
		}
	}

	function onUpdate( _properties )
	{
	}

	function onNewDay()
	{
		local factions = [];
		factions.extend(this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse));
		factions.extend(this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalCityState));

		foreach( f in factions )
		{
			if (f.m.PlayerRelation > 30)
			{
				f.m.PlayerRelation = this.Math.minf(100.0, this.Math.max(0.0, f.m.PlayerRelation - 0.1));
				f.updatePlayerRelation();
			}
		}
	}

});

