this.town_main_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "MainDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function clear()
	{
	}

	function reload()
	{
		this.m.JSHandle.asyncCall("loadFromData", this.m.Parent.queryTownInformation());
	}

	function preload( _settlement )
	{
		if (_settlement == null || !("getUIPreloadInformation" in _settlement))
		{
			return;
		}

		this.m.JSHandle.asyncCall("loadFromData", _settlement.getUIPreloadInformation());
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

});

