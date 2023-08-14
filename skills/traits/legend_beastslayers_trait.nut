this.legend_beastslayers_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_beastslayers";
		this.m.Name = "Natural Order";
		this.m.Icon = "ui/traits/legend_natural_order_trait.png";
		this.m.Description = "Nature is not for the faint of heart — those that dwell on the fringes of society not only thrive in the danger, but know the natural order of things will eat them alive. Quite literally.";
		this.m.Order = this.Const.SkillOrder.Trait - 2;
		this.m.Excluded = [];
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
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve when in battle with beasts"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Melee damage when in battle with beasts"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Ranged damage when in battle with beasts"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		local fightingBeasts = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Beasts || enemy.getType() == this.Const.EntityType.BarbarianUnhold || enemy.getType() == this.Const.EntityType.BarbarianUnholdFrost)
			{
				fightingBeasts = true;
				break;
			}
		}

		if (fightingBeasts)
		{
			_properties.Bravery += 5;
			_properties.MeleeDamageMult *= 1.1;
			_properties.RangedDamageMult *= 1.1;
			this.m.Type = ::Const.SkillType.StatusEffect;
		}
		else
		{
			this.m.Type = ::Const.SkillType.Trait;
		}
	}

});

