this.defeat_kraken_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.defeat_kraken";
		this.m.Duration = 35.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "There are rumors about a colossal beast that lurks in the swamps.\nIf we find and slay it, eternal fame will be our reward!";
		this.m.UIText = "Defeat a Kraken";
		this.m.TooltipText = "Defeat a Kraken in battle. You\'ll find it somewhere out there, in the wild.";
		this.m.SuccessText = "[img]gfx/ui/events/event_89.png[/img]In your dreams it dwells, a slick bulbous head wimpled with lily pads and combed kudzu and its breath lifts the mire like the gargle of a cauldron\'s broth. Its tentacles writhe in the penumbra like shadows upon shadows. So it is here in the far, far dark, a void into which it has carved a place and become an idle horror. When it appears in your dreams it is such that you have gone to it. You enter the blackness and step forward, hand out, but that\'s all you do. You never truly draw near. Sometimes your dreams will be of something else, but you know the beast is out there somewhere, you only need to open a door or walk down some steps and you will find it and its domain again. You need not talk to your men to know they dream of it too.\n\n The world has come to know your slaying of the kraken, but they see it in hearsay, they see it as something drawn by a mother\'s tongue to rush a child to bed, or a father emboldening his kin by speaking to man\'s triumph over terror. But they don\'t see it. They see the rumor, not the monster, and they treat the %companyname% as living legends. And like legends with each day the men of the company fade from the tales and are replaced by proper heroes, every corner of the earth fashioning a more valiant victor over the creature. A common sellsword would never brave such a beast they say! It was the knights of the east! The kingsguard of the north! Vanity has taken your place. But the brothers you battle with know the truth and even a dying truth is well enough to get on.\n\n So there in the dark it dwells, and there you visit it often.";
		this.m.SuccessButtonText = "What other hunter can claim a feat such as this?";
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		if (this.World.getTime().Days <= 100)
		{
			return;
		}

		if (this.World.Ambitions.getDone() < 20)
		{
			return;
		}

		if (this.World.Flags.get("IsKrakenDefeated"))
		{
			this.m.IsDone = true;
			return;
		}

		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Flags.get("IsKrakenDefeated"))
		{
			return true;
		}

		return false;
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

