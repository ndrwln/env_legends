this.bag_fatigue <- this.inherit("scripts/skills/skill", {
	function create()
	{
		this.m.ID = "special.bag_fatigue";
		this.m.Name = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Special;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsSerialized = false;
	}

	function onUpdate( _properties )
	{
		local hasBagsAndBelts = this.getContainer().hasSkill("perk.bags_and_belts");
		local items = this.getContainer().getActor().getItems().getAllItemsAtSlot(this.Const.ItemSlot.Bag);

		foreach( item in items )
		{
			if (!hasBagsAndBelts || item.getBlockedSlotType() != null)
			{
				_properties.Stamina += item.getStaminaModifier() / 2;
			}
		}
	}

});

