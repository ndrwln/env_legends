this.all_naked_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.all_naked";
		this.m.Title = "Along the road...";
		this.m.Cooldown = 9999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_16.png[/img]Marching along, you spot a fellow traveler who leans forward and then back and then forward again, all the while his hand knowing not whether to shield the sun or peel away to let himself be blinded. He shakes his head and spits.%SPEECH_ON%I\'d heard word of you folks. Buncha trouserless folk in a land of evil, like some devil\'s little joke sprung to life. The hell are you?%SPEECH_OFF%You shrug and tell the man that, so far, you\'ve no issue with taking on your troubles sans leather or plate or cloth of loin. Again, the traveler shakes his head and spits.%SPEECH_ON%Farkin\' hell. A warrior in battle with nothing on him is more naked than the day he\'d done been born! I s\'pose the irony is that if we - and I mean anybody-we - come find ya dead in the fields, then we\'ll probably dress ya better for the grave than you dress yourself now. Which shan\'t be hard, seeing as how you\'ve dressed yourself none at all.%SPEECH_OFF%With a bit of a wave, you thank the traveler for his kind words before continuing your merry march.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "What a beautiful day!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < 14)
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();

		if (!currentTile.HasRoad)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		foreach( bro in brothers )
		{
			if (bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body) != null)
			{
				return;
			}
		}

		this.m.Score = 25;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

