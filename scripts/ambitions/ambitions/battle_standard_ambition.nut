this.battle_standard_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.battle_standard";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We need a battle standard so that we\'re recognized from afar!\nHaving one be made is costly, so we shall gather 2,000 crowns for this.";
		this.m.RewardTooltip = "You\'ll be awarded a unique item that grants anyone near the wearer additional resolve.";
		this.m.UIText = "Have at least 2,000 crowns";
		this.m.TooltipText = "Gather the amount of 2,000 crowns or more, so that you can afford to have a battle standard made for the company. You can make money by completing contracts, looting camps and ruins, or trading. You\'ll also need space enough in your inventory for a new item.";
		this.m.SuccessText = "[img]gfx/ui/events/event_65.png[/img]No one likes a skinflint, least of all a group of wandering, bloodthirsty rabble motivated primarily by a love of coin. Not everyone, or more precisely, no one, was thrilled when you suggested cutting back on spending to save up for a company standard.\n\nOnce the %companyname%\'s standard is finally paid for and hoisted for the first time to proudly snap in a fresh dawn breeze, however, no one claims it wasn\'t worth it. The men are proud of their new standard, even tossing around names for it around the campfire, though none of them really stick.\n\nIt\'s clear for everyone to see now, this is not some band of hired thugs, this is becoming a true mercenary company. Who should have the honor of carrying the standard?";
		this.m.SuccessButtonText = "Men, those are our colors now!";
	}

	function onUpdateScore()
	{
		if (this.World.Ambitions.getDone() < 1)
		{
			return;
		}

		this.m.Score = 10;
	}

	function onCheckSuccess()
	{
		if (this.World.Assets.getMoney() >= 2000 && this.World.Assets.getStash().hasEmptySlot())
		{
			return true;
		}

		return false;
	}

	function onReward()
	{
		local item;
		local stash = this.World.Assets.getStash();
		this.World.Assets.addMoney(-1000);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/icons/asset_money.png",
			text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]1,000[/color] Crowns"
		});
		item = this.new("scripts/items/tools/player_banner");
		item.setVariant(this.World.Assets.getBannerID());
		stash.add(item);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/items/" + item.getIcon(),
			text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
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

