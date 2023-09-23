this.town_tavern_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Tavern = null
	},
	function setTavern( _t )
	{
		this.m.Tavern = _t;
	}

	function create()
	{
		this.m.ID = "TavernDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function clear()
	{
		this.m.Tavern = null;
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

	function onQueryRumor()
	{
		local data = {
			Rumor = this.m.Tavern.getRumor(true),
			DrinkPrice = this.m.Tavern.getDrinkPrice(),
			RumorPrice = this.m.Tavern.getRumorPrice(),
			Assets = this.m.Parent.queryAssetsInformation()
		};
		return data;
	}

	function onDrink()
	{
		local data = {
			Drink = this.m.Tavern.getDrinkResult(),
			DrinkPrice = this.m.Tavern.getDrinkPrice(),
			RumorPrice = this.m.Tavern.getRumorPrice(),
			Assets = this.m.Parent.queryAssetsInformation()
		};
		return data;
	}

	function queryData()
	{
		return {
			Title = "Tavern",
			SubTitle = "A large tavern filled with patrons from all over the lands",
			Rumor = this.m.Tavern.getRumor(false),
			RumorPrice = this.m.Tavern.getRumorPrice(),
			Drink = null,
			DrinkPrice = this.m.Tavern.getDrinkPrice(),
			LeftInfo = "Pay for a round to get the patrons to share more news and rumors ([img]gfx/ui/tooltips/money.png[/img]" + this.Math.round(20 * this.m.Tavern.getSettlement().getBuyPriceMult()) + ").",
			RightInfo = "Pay a round for your mercenaries to get their spirits up ([img]gfx/ui/tooltips/money.png[/img]" + this.Math.round(this.World.getPlayerRoster().getSize() * 5 * this.m.Tavern.getSettlement().getBuyPriceMult()) + ").",
			Assets = this.m.Parent.queryAssetsInformation()
		};
	}

});

