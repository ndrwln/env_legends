this.ground_grains_item <- this.inherit("scripts/items/supplies/legend_usable_food", {
	m = {},
	function create()
	{
		this.legend_usable_food.create();
		this.m.ID = "supplies.ground_grains";
		this.m.Name = "Ground Grains";
		this.m.Description = "Provisions. Various kinds of grounded grain that will be cooked up with water or milk for a daily meal. It is satiating but tasteless. Can be eaten in battle to provide up to 1 healing and fatigue recovery over ten turns, based on the amount remaining. Will be gradually used as provisions if left in the company stash.";
		this.m.Icon = "supplies/inventory_provisions_03.png";
		this.m.Value = 50;
		this.m.Amount = 15.0;
		this.m.GoodForDays = 7;
	}

	function getBuyPrice()
	{
		if (this.m.IsSold)
		{
			return this.getSellPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getPriceMult() * this.World.State.getCurrentTown().getFoodPriceMult() * this.World.State.getCurrentTown().getBuyPriceMult()));
		}

		return this.item.getBuyPrice();
	}

	function getSellPrice()
	{
		if (this.m.IsBought)
		{
			return this.getBuyPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.floor(this.getValue() * this.World.State.getCurrentTown().getFoodPriceMult() * this.World.State.getCurrentTown().getSellPriceMult());
		}

		return this.item.getSellPrice();
	}

	function onPutIntoBag()
	{
		this.onEquip();
	}

	function onEquip()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_rations_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}

});

