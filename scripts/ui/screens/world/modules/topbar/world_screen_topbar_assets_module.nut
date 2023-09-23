this.world_screen_topbar_assets_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnBrothersPressedListener = null
	},
	function setOnBrothersPressedListener( _listener )
	{
		this.m.OnBrothersPressedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnBrothersPressedListener = null;
	}

	function create()
	{
		this.m.ID = "TopbarAssetsModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function update( _data )
	{
		this.m.JSHandle.asyncCall("update", _data);
	}

	function onBrothersButtonPressed()
	{
		if (this.m.OnBrothersPressedListener != null)
		{
			this.m.OnBrothersPressedListener();
		}
	}

});

