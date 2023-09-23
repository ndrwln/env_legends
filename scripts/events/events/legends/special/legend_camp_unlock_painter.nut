this.legend_camp_unlock_painter <- this.inherit("scripts/events/event", {
	m = {
		TownName = ""
	},
	function create()
	{
		this.m.ID = "event.legend_camp_unlock_painter";
		this.m.Title = "At %townname%";
		this.m.Cooldown = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_camp_barber.png[/img]You unlocked painting tent. Hurray.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Armor painting unlocked in camp.",
					function getResult( _event )
					{
						this.World.Flags.set("HasLegendCampPainter", true);
					}

				}
			],
			function start( _event )
			{
			}

		});
	}

	function setTownName( _v )
	{
		this.m.TownName = _v;
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"townname",
			this.m.TownName
		]);
	}

});

