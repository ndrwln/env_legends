this.defeat_orc_location_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {
		Defeated = 0
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.defeat_orc_location";
		this.m.Duration = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "Besting orcs in battle and burning down some of their camps would make people\nrecognize the company\'s ability on the battlefield. Let us do so!";
		this.m.RewardTooltip = "You\'ll be awarded a unique accessory that makes the wearer immune to being stunned.";
		this.m.UIText = "Destroy locations controlled by orcs";
		this.m.TooltipText = "Destroy four locations controlled by orcs to prove the company\'s prowess, whether as part of a contract or by heading out on your own. You\'ll also need space enough in your inventory for a new item.";
		this.m.SuccessText = "[img]gfx/ui/events/event_81.png[/img]With the %recently_destroyed% still smouldering in your wake, a group of people come out from their hiding place in a nearby copse of trees where they had been watching the battle from afar. An old woman approaches you.%SPEECH_ON%Those green-skinned fiends drove us from our farm outside %nearesttown%, but thanks to you stalwart fellows we will prosper again. This is for you.%SPEECH_OFF%She proffers a bag of apples. Though it isn\'t much of a reward, the sentiment will be repeated again and again as word spreads of the orcs\' destruction. %highestexperience_brother% barks out a laugh and bites into one of the juicy apples.%SPEECH_ON%With orcs, the big ones are too slow, and the young ones too stupid. Strategy overcomes brute force every time. The great green beasts depend on fear to do their work for them. Stand fast and they can be beat like anyone else!%SPEECH_OFF%The peasants marvel at %highestexperience_brother%\'s speech, and prowess, and strength, clapping their hands, showering him with compliments and patting him on the back. While certainly true words, this is hardly the audience that should put his advice to use. You lay your hand on %highestexperience_brother%\'s shoulder, as if to say to drop it a notch, lest any of the peasants think themselves heroes next time they spot a greenskin.";
		this.m.SuccessButtonText = "Tell everyone it was the %companyname% who won here!";
	}

	function getUIText()
	{
		return this.m.UIText + " (" + this.m.Defeated + "/4)";
	}

	function onLocationDestroyed( _location )
	{
		if (this.World.FactionManager.getFaction(_location.getFaction()).getType() == this.Const.FactionType.Orcs)
		{
			++this.m.Defeated;
			this.World.Ambitions.updateUI();
		}
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < 25)
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
		item = this.new("scripts/items/accessory/orc_trophy_item");
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

