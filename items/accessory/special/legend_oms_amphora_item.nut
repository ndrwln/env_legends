this.legend_oms_amphora_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		IsConsumed = false
	},
	function isAllowedInBag( _actor )
	{
		return false;
	}

	function isConsumed()
	{
		return this.m.IsConsumed;
	}

	function setConsumed( _r )
	{
		this.m.IsConsumed = _r;

		if (!this.m.IsConsumed)
		{
			this.m.Icon = "accessory/oms_amphora_full.png";
		}
		else
		{
			this.m.Icon = "accessory/oms_amphora_empty.png";
		}
	}

	function getName()
	{
		if (this.m.IsConsumed)
		{
			return this.item.getName() + " (Consumed)";
		}
		else
		{
			return this.item.getName();
		}
	}

	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.legend_oms_amphora";
		this.m.Name = "Ancient Amphora";
		this.m.Description = "An ancient glazed pot that has seen much use before your time. It depicts specific characters fighting over ripe fields with the amphora at the centre - a sickly grey mulch resides inside. When emptied, the vessel appears to gradually refill from a second chamber within the walls of the item. The freshness of the drink does not improve.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.ShowOnCharacter = false;
		this.m.IsDroppedAsLoot = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/oms_amphora_full.png";
		this.m.Value = 2450;
	}

	function getTooltip()
	{
		local result = [
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
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		if (!this.World.Flags.get("Item Identified"))
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Does something...?"
			});
			return result;
		}
		else
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Drinking in battle provides a random status effect. May be harmful or helpful. Refills after every battle."
			});
			return result;
		}
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onEquip()
	{
		this.accessory.onEquip();
		this.addSkill(::new("scripts/skills/actives/legend_oms_amphora_skill"));
	}

	function onCombatFinished()
	{
		this.setConsumed(false);
	}

});

