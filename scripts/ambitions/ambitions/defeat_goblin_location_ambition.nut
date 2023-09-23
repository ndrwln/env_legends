this.defeat_goblin_location_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {
		Defeated = 0
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.defeat_goblin_location";
		this.m.Duration = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "Only the most daring take on goblins in larger numbers. We shall burn some\nof their fetid camps to the ground, and word of it will travel!";
		this.m.RewardTooltip = "You\'ll be awarded a unique accessory that makes the wearer immune to being rooted.";
		this.m.UIText = "Destroy locations controlled by goblins";
		this.m.TooltipText = "Destroy four locations controlled by goblins to prove the company\'s prowess, whether as part of a contract or by heading out on your own. You\'ll also need space enough in your inventory for a new item.";
		this.m.SuccessText = "[img]gfx/ui/events/event_83.png[/img]The men are scattered across the battlefield, still breathing heavily after a hard fight. As you survey the ground, so do %randombrother% and %randombrother2% scour it for valuables.%SPEECH_ON%We advance, they retreat. We fall back, they harry us. Fire a volley of arrows and they take cover. A shieldwall is pricked through with poisoned blades, and at a charge they scatter like bugs. Those damned things they fling at you will fly through my dreams in nights to come.%SPEECH_OFF%%randombrother2% pokes a dead goblin with his weapon, and, satisfied that he is very much dead indeed, knees down to take a closer look at its belongings.%SPEECH_ON%But the more bitter the fight, the sweeter the victory.%SPEECH_OFF%He stands up and meets %randombrother%\'s gaze.%SPEECH_ON%The more bitter the fight, the more alive I feel. Come on.%SPEECH_OFF%They slowly continue on to join up with the rest of the men, stopping here and there to look for things worth a crowns or two when next the company makes it away to a city.";
		this.m.SuccessButtonText = "Victory!";
	}

	function getUIText()
	{
		return this.m.UIText + " (" + this.m.Defeated + "/4)";
	}

	function onLocationDestroyed( _location )
	{
		if (this.World.FactionManager.getFaction(_location.getFaction()).getType() == this.Const.FactionType.Goblins)
		{
			++this.m.Defeated;
			this.World.Ambitions.updateUI();
		}
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < 20)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		this.m.Score = 2 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (!this.World.Assets.getStash().hasEmptySlot())
		{
			return false;
		}

		if (this.m.Defeated >= 4)
		{
			return true;
		}

		return false;
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"recently_destroyed",
			this.World.Statistics.getFlags().get("LastLocationDestroyedName")
		]);
	}

	function onReward()
	{
		local item;
		local stash = this.World.Assets.getStash();
		item = this.new("scripts/items/accessory/goblin_trophy_item");
		stash.add(item);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/items/" + item.getIcon(),
			text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
		});
	}

	function onClear()
	{
		this.m.Defeated = 0;
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
		_out.writeU8(this.m.Defeated);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
		this.m.Defeated = _in.readU8();
	}

});

