this.discover_all_unique_locations_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.discover_all_unique_locations";
		this.m.Duration = 7.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "Places of legend dot the world, hiding wonderous secrets within.\nLet\'s not rest until we\'ve found every last one of them!";
		this.m.UIText = "Discover all legendary locations in the world";
		this.m.TooltipText = "Discover all legendary treasures that exist in the world by going off on your own and exploring the wilds. Make sure to stock up on provisions before heading out!";
		this.m.SuccessText = "[img]gfx/ui/events/event_45.png[/img]Your map\'s edges are frayed, and its creases so worn they may as well be fine felt against the fingers. The paper is heavier than it looks, and it\'s come to shield you from rain and snow, it\'s been there stuffed beneath the haystraw upon which you slept, and it\'s been threatened with use as a kindling in dire times. But it\'s also lighter than it looks, for the wind has stolen it straight from your fingers a time or many and you\'ve chased it across fields all the while yelling like some jackal losing the chase and calling it a whoreson\'s work as it twisted and eluded.\n\nPer the original cartographer\'s work, your company was not to leave the roads or stray from the towns. He\'d written warnings such as \'doom and doom only\' and \'here be bandits and their no good mothers.\' You ignored the lot of these and drew over them with your own squiggly lines of explorative demarcations. These were not places of superstition, these were places the %companyname% would and did go. For etching lines upon a limp map you\'ve become notorious as quasi explorers of places the world long since shut its doors on. And what else may be out there but perhaps a place far beyond this one?";
		this.m.SuccessButtonText = "We draw our own maps.";
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.discover_unique_locations").isDone())
		{
			return;
		}

		if (!this.World.Flags.has("LegendaryLocationsDiscovered"))
		{
			this.World.Flags.set("LegendaryLocationsDiscovered", 0);
		}

		if (this.World.Flags.get("LegendaryLocationsDiscovered") >= 11)
		{
			return;
		}

		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		return this.World.Flags.get("LegendaryLocationsDiscovered") >= 11;
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

