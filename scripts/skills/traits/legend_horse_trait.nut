this.legend_horse_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_horse";
		this.m.Name = "Horse";
		this.m.Icon = "ui/traits/trait_icon_07.png";
		this.m.Description = "A horse eats more than humans, can\'t wear human armor, moves much better on flat terrain, but worse on rough terrain";
		this.m.Titles = [
			"the Horse",
			"the Stallion",
			"the Mare"
		];
		this.m.Excluded = [
			"trait.spartan",
			"trait.fragile"
		];
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
			}
		];
	}

	function addTitle()
	{
		this.character_trait.addTitle();
	}

	function onAdded()
	{
		local items = this.getContainer().getActor().getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = -1;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = -1;
		items.getData()[this.Const.ItemSlot.Head][0] = -1;
		items.getData()[this.Const.ItemSlot.Ammo][0] = -1;
		this.getContainer().getActor().getFlags().add("IsHorse");
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local gt = this.getroottable();
		actor.m.ActionPointCosts = this.Const.HorseMovementAPCost;
		actor.m.FatigueCosts = clone this.Const.HorseMovementFatigueCost;
		_properties.DailyFood += 4.0;
	}

});

