this.defeat_undead_location_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {
		Defeated = 0
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.defeat_undead_location";
		this.m.Duration = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "The walking dead are a terrible curse upon man.\nLet us burn some of their lairs to the ground and earn the respect of all decent folk!";
		this.m.RewardTooltip = "You\'ll be awarded a unique accessory that doubles the wearer\'s resolve when defending against fear and mind control effects.";
		this.m.UIText = "Destroy locations beset by undead";
		this.m.TooltipText = "Destroy four locations beset by undead to prove the company\'s prowess, whether as part of a contract or by heading out on your own. You\'ll also need space enough in your inventory for a new item.";
		this.m.SuccessText = "[img]gfx/ui/events/event_46.png[/img]Thanks to the %companyname%, the shambling monstrosities of the %recently_destroyed% will never again threaten innocent folk. The men, however, will need a few days, and copious amounts of drink, to process the horrors they faced.%SPEECH_ON%How can anything so foul show itself by the light of day?%SPEECH_OFF%Asks %randombrother%, starring blandly into the distance.%SPEECH_ON%It collapsed straight into a heap of rotten bones and dust. Nothing at all holding it together but its curse.%SPEECH_OFF%Even darker fears are sparked for %fearful_brother%.%SPEECH_ON%They told me back in %randomtown% that any good man killed by one of them horrors is doomed to come back from the grave himself and can never sit by the gods.%SPEECH_OFF%Some men argue loudly against this, not because they know better, but because they don\'t want it to be true. You give the order to bank the fire before someone starts telling any more ghost stories. The men may have trouble sleeping this night, but morale will rise again with the dawn.";
		this.m.SuccessButtonText = "Be that as it may, we are victorious again!";
	}

	function getUIText()
	{
		return this.m.UIText + " (" + this.m.Defeated + "/4)";
	}

	function onLocationDestroyed( _location )
	{
		if (this.World.FactionManager.getFaction(_location.getFaction()).getType() == this.Const.FactionType.Undead || this.World.FactionManager.getFaction(_location.getFaction()).getType() == this.Const.FactionType.Zombies)
		{
			++this.m.Defeated;
			this.World.Ambitions.updateUI();
		}
	}

	function onUpdateScore()
	{
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
		local brothers = this.World.getPlayerRoster().getAll();
		local fearful = [];
		local lowborn = [];

		if (brothers.len() > 1)
		{
			for( local i = 0; i < brothers.len(); i = i )
			{
				if (brothers[i].getSkills().hasSkill("trait.player"))
				{
					brothers.remove(i);
					break;
				}

				i = ++i;
			}
		}

		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("trait.superstitious"))
			{
				fearful.push(bro);
			}
			else if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Lowborn))
			{
				lowborn.push(bro);
			}
		}

		local fear;

		if (fearful.len() != 0)
		{
			fear = fearful[this.Math.rand(0, fearful.len() - 1)];
		}
		else if (lowborn.len() != 0)
		{
			fear = lowborn[this.Math.rand(0, lowborn.len() - 1)];
		}
		else
		{
			fear = brothers[this.Math.rand(0, brothers.len() - 1)];
		}

		_vars.push([
			"fearful_brother",
			fear.getName()
		]);
		_vars.push([
			"recently_destroyed",
			this.World.Statistics.getFlags().get("LastLocationDestroyedName")
		]);
	}

	function onReward()
	{
		local item;
		local stash = this.World.Assets.getStash();
		item = this.new("scripts/items/accessory/undead_trophy_item");
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
		_out.writeU8(this.m.Defeated);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
		this.m.Defeated = _in.readU8();
	}

});

