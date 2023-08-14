this.dies_item <- this.inherit("scripts/items/trade/trading_good_item", {
	m = {},
	function create()
	{
		this.trading_good_item.create();
		this.m.ID = "misc.dies";
		this.m.Name = "Dyes";
		this.m.Description = "Valuable dyes made from various plants or minerals. Could be used to make other things. Traders will pay good coin for this.";
		this.m.Icon = "trade/inventory_trade_02.png";
		this.m.Culture = this.Const.World.Culture.Neutral;
		this.m.ProducingBuildings = [
			"attached_location.dye_maker"
		];
		this.m.Value = 175;
		this.m.ResourceValue = 2;
	}

});

