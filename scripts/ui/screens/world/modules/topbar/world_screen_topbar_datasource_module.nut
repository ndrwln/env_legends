this.world_screen_topbar_datasource_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		LastTimeInformationUpdate = 38429
	},
	function clearEventListener()
	{
	}

	function create()
	{
		this.m.ID = "TopbarDatasourceModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function updateTimeInformation()
	{
		local currentTime = this.World.getTime();

		if (this.Math.abs(currentTime.Minutes - this.m.LastTimeInformationUpdate) < 2)
		{
			return;
		}

		this.m.LastTimeInformationUpdate = currentTime.Minutes;
		local degrees = currentTime.SecondsOfDay / currentTime.SecondsPerDay * 360.0 + 200.0;

		if (degrees > 360.0)
		{
			degrees = degrees - 360.0;
		}

		local data = {
			day = currentTime.Days,
			time = this.Const.Strings.World.TimeOfDay[currentTime.TimeOfDay],
			degree = degrees
		};
		this.m.JSHandle.asyncCall("loadTimeInformation", data);
	}

	function updateAssetsInformation()
	{
		this.m.JSHandle.asyncCall("loadAssetsInformation", this.UIDataHelper.convertAssetsInformationToUIData());
	}

});

