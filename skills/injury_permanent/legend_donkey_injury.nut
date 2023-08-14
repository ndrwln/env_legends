this.legend_donkey_injury <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.legend_donkey_background";
		this.m.Name = "Donkey body";
		this.m.Icon = "ui/traits/legend_donkey_body.png";
		this.m.Description = "This character is a donkey, it can\'t use weapons, shields, ammunition or armor";
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
		this.addTooltipHint(ret);
		return ret;
	}

	function onAdded()
	{
		local items = this.getContainer().getActor().getItems();
		items.getData()[this.Const.ItemSlot.Offhand][0] = -1;
		items.getData()[this.Const.ItemSlot.Mainhand][0] = -1;
		items.getData()[this.Const.ItemSlot.Head][0] = -1;
		items.getData()[this.Const.ItemSlot.Body][0] = -1;
		items.getData()[this.Const.ItemSlot.Ammo][0] = -1;
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
	}

});

