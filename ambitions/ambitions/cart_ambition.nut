this.cart_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.cart";
		this.m.Duration = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We can barely carry any more equipment or spoils of war.\nLet us save up 7,500 crowns to buy us a cart and relieve our backs!";
		this.m.RewardTooltip = "You\'ll unlock an additional 27 slots in your inventory.";
		this.m.UIText = "Have at least 7,500 crowns";
		this.m.TooltipText = "Gather the amount of 7,500 crowns or more, so that you can afford to buy a cart for additional inventory space. You can make money by completing contracts, looting camps and ruins, or trading.";
		this.m.SuccessText = "[img]gfx/ui/events/event_158.png[/img]Gathering enough crowns to pay the cartmaker for his work did cost you an arm and a leg, quite literally in some cases. Now the proud owner of a new wagon, you\'re able to carry both more equipment and more spoils of war, be it silverware and golden crowns, or the half-torn and lice filled gambeson of a random thug.\n\nAfter traveling the first miles with the new wheels you notice that %randombrother% seems to be missing. Looking around, you eventually find him hidden behind some grain bags on the wagon, snoring away peacefully. Some cold water to the head and a boot to the butt quickly get the sluggard back on his feet and walking like the others. Still, you better make sure the men know their place.%SPEECH_ON%I won\'t have any of this! The only way anyone of the %companyname% will ever find himself on this wagon is carrying his own head under the arm! Be ever watchful and have your arms at the ready when we travel these lands!%SPEECH_OFF%The men grumble and continue on.";
		this.m.SuccessButtonText = "Get moving!";
	}

	function onUpdateScore()
	{
		return;
	}

	function onCheckSuccess()
	{
		if (this.World.Assets.getMoney() >= 7500)
		{
			return true;
		}

		return false;
	}

	function onReward()
	{
		local item;
		local stash = this.World.Assets.getStash();
		this.World.Assets.addMoney(-5000);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/icons/asset_money.png",
			text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]5,000[/color] Crowns"
		});
		this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 27);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/icons/special.png",
			text = "You gain 27 additional inventory slots"
		});
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
	}

});

