this.legend_oms_rib_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.legend_oms_rib";
		this.m.Name = "Saint\'s Rib";
		this.m.Description = "A supposed rib bone from a long dead saint, locked away in a secure chest. Apparently the figure in question killed by a volley of arrows — it has been picked clean and preserved with great care and thought. More superstitious minds claim it to be warm to the touch.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/oms_rib.png";
		this.m.Value = 1350;
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
				text = "Damage from ranged weapons reduced by 66%. Damage received from leee weapons increased by 33%."
			});
			return result;
		}
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);
		_properties.DamageReceivedRangedMult *= 0.33;
		_properties.DamageReceivedMeleeMult *= 1.33;
	}

});

