this.wine_item <- this.inherit("scripts/items/supplies/legend_usable_food", {
	m = {},
	function create()
	{
		this.legend_usable_food.create();
		this.m.ID = "supplies.wine";
		this.m.Name = "Wine";
		this.m.Description = "Provisions. Wine made from squashed and fermented grapes. Both elaborate to produce and expensive to buy. Can be drunk in battle to gain +6% resolve, melee and ranged skill, at the expense of -12% initiative, melee and ranged defense. Will be used as provisions if left in the company stash";
		this.m.Icon = "supplies/inventory_provisions_13.png";
		this.m.Value = 140;
		this.m.Amount = 35.0;
		this.m.GoodForDays = 11;
	}

	function getBuyPrice()
	{
		if (this.m.IsSold)
		{
			return this.getSellPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			local isBuildingPresent = this.World.State.getCurrentTown().hasAttachedLocation("attached_location.winery");
			return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getPriceMult() * this.World.State.getCurrentTown().getFoodPriceMult() * this.Const.Difficulty.BuyPriceMult[this.World.Assets.getEconomicDifficulty()] * this.World.State.getCurrentTown().getBuyPriceMult() * (isBuildingPresent ? 1.0 : 1.5)));
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
			local isBuildingPresent = this.World.State.getCurrentTown().hasAttachedLocation("attached_location.winery");
			return this.Math.floor(this.item.getSellPrice() * (isBuildingPresent ? this.Const.World.Assets.BaseSellPrice : this.Const.World.Assets.SellPriceNotProducedHere));
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
		local skill = this.new("scripts/skills/actives/legend_drink_wine_skill");
		skill.setItem(this);
		this.addSkill(skill);
	}

});

