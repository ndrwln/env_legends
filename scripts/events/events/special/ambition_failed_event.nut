this.ambition_failed_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.ambition_failed";
		this.m.Title = "During camp...";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_64.png[/img]{%randombrother% grumbles.%SPEECH_ON%Giving up is not the way of this company, or at least I didn\'t think it was.%SPEECH_OFF%The men have been moping about today, cursing loudly about nothing and muttering into their drink. They are unhappy about the company not achieving the goal everyone agreed on.%SPEECH_ON%Certainly we could chase this task we set ourselves across the world and back, just as we could spend our days chasing butterflies, but if it cannot be done let\'s put this misfortune behind us and move on to what we do best: fighting, drinking, and spending our hard-earned coin!%SPEECH_OFF%%highestexperience_brother% encourages his brothers-in-arms. These words placate the men somewhat and you are relieved not to have a revolt on your hands. | As you walk around the tents of the camp, %randombrother% approaches to complain.%SPEECH_ON%I seem to recall signing up with a band of merciless fighting men. Men who let nothing stand in their path. Now the %companyname% feels more like a squad of tired children than an unstoppable force.%SPEECH_OFF%He pauses, bites his lips.%SPEECH_ON%Captain, sir, I mean.%SPEECH_OFF%You nod and continue on your way. Clearly, the man is upset about the company\'s inability to fulfill the goal you announced to the men not long ago. | Despite your best efforts, you failed in fulfilling your latest ambition on the company\'s path to greatness. Worse, the men are all keenly aware of it, and seem more put out by this failure than you are. Feet are dragging, heads hanging, and griping and discontent louder than usual.\n\nStill, the sun rises just the same, and to worry over one\'s failures is to waste time better spent on new opportunities. You know that the men of the %companyname% will ride out this setback and march on to greater glories. Or die in the attempt. | After much striving and effort, you are finally forced to give up on the ambition you chose for the %companyname% to pursue. A mercenary company must face many setbacks on the road to greatness, but this latest failure to follow through has been especially bitter for the men. It would be wise to secure a lucrative contract or provide some other distraction, perhaps the threat of imminent death, to distract them from their unhappiness. | After you tell the men that the company isn\'t going to be able to do what you so proudly announced it would accomplish, the men grow standoffish and moody. Like sulky children they turn away when you come near and whisper their complaints whenever your back is turned.%SPEECH_ON%How are we ever going to be famous if we don\'t finish what we started? I want to be known wherever we go, and have our drinks poured before we walk in the door.%SPEECH_OFF%}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "{Not everything goes as planned. | Oh well. | The men will understand. | This won\'t stop the %companyname%. | The important thing is that we\'re moving forward. | New challenges await.}",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						bro.worsenMood(this.Const.MoodChange.AmbitionFailed, "Lost confidence in your leadership");

						if (bro.getMoodState() < this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local lowest_hiretime = 100000000.0;
		local lowest_hiretime_bro;
		local highest_hiretime = -9999.0;
		local highest_hiretime_bro;
		local highest_bravery = 0;
		local highest_bravery_bro;
		local lowest_hitpoints = 9999;
		local lowest_hitpoints_bro;

		foreach( bro in brothers )
		{
			if (bro.getHireTime() < lowest_hiretime)
			{
				lowest_hiretime = bro.getHireTime();
				lowest_hiretime_bro = bro;
			}

			if (bro.getHireTime() > highest_hiretime)
			{
				highest_hiretime = bro.getHireTime();
				highest_hiretime_bro = bro;
			}

			if (bro.getCurrentProperties().getBravery() > highest_bravery)
			{
				highest_bravery = bro.getCurrentProperties().getBravery();
				highest_bravery_bro = bro;
			}

			if (bro.getHitpoints() < lowest_hitpoints)
			{
				lowest_hitpoints = bro.getHireTime();
				lowest_hitpoints_bro = bro;
			}
		}

		_vars.push([
			"highestexperience_brother",
			lowest_hiretime_bro.getName()
		]);
		_vars.push([
			"strongest_brother",
			lowest_hiretime_bro.getName()
		]);
		_vars.push([
			"lowestexperience_brother",
			highest_hiretime_bro.getName()
		]);
		_vars.push([
			"bravest_brother",
			highest_bravery_bro.getName()
		]);
		_vars.push([
			"lowesthp_brother",
			lowest_hitpoints_bro.getName()
		]);
		local towns = this.World.EntityManager.getSettlements();
		local playerTile = this.World.State.getPlayer().getTile();
		local nearest_town_distance = 999999;
		local nearest_town;

		foreach( t in towns )
		{
			local d = t.getTile().getDistanceTo(playerTile);

			if (d < nearest_town_distance)
			{
				nearest_town_distance = d;
				nearest_town = t;
			}
		}

		_vars.push([
			"currenttown",
			nearest_town.getName()
		]);
		_vars.push([
			"nearesttown",
			nearest_town.getName()
		]);
	}

	function onClear()
	{
	}

});

