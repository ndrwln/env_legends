this.world_campfire_screen <- {
	m = {
		JSHandle = null,
		MainDialogModule = null,
		HireDialogModule = null,
		Visible = null,
		Animating = null,
		LastActiveModule = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null,
		OnModuleClosedListener = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		if (this.m.Animating != null && this.m.MainDialogModule != null && this.m.HireDialogModule != null)
		{
			return this.m.Animating == true || this.m.MainDialogModule.isAnimating() || this.m.HireDialogModule.isAnimating();
		}
		else
		{
			return false;
		}
	}

	function getMainDialogModule()
	{
		return this.m.MainDialogModule;
	}

	function getHireDialogModule()
	{
		return this.m.HireDialogModule;
	}

	function setOnConnectedListener( _listener )
	{
		this.m.OnConnectedListener = _listener;
	}

	function setOnDisconnectedListener( _listener )
	{
		this.m.OnDisconnectedListener = _listener;
	}

	function setOnModuleClosedListener( _listener )
	{
		this.m.OnModuleClosedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnConnectedListener = null;
		this.m.OnDisconnectedListener = null;
		this.m.OnModuleClosedListener = null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
		this.m.JSHandle = this.UI.connect("WorldCampfireScreen", this);
		this.m.MainDialogModule = this.new("scripts/ui/screens/world/modules/world_campfire_screen/campfire_main_dialog_module");
		this.m.MainDialogModule.setParent(this);
		this.m.MainDialogModule.connectUI(this.m.JSHandle);
		this.m.HireDialogModule = this.new("scripts/ui/screens/world/modules/world_campfire_screen/campfire_hire_dialog_module");
		this.m.HireDialogModule.setParent(this);
		this.m.HireDialogModule.connectUI(this.m.JSHandle);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.HireDialogModule.destroy();
		this.m.HireDialogModule = null;
		this.m.MainDialogModule.destroy();
		this.m.MainDialogModule = null;
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function clear()
	{
		this.m.Town = null;
		this.m.HireDialogModule.clear();
		this.m.MainDialogModule.clear();
	}

	function show()
	{
		if (this.m.JSHandle != null)
		{
			this.m.LastActiveModule = null;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", this.m.MainDialogModule.queryData());
		}
	}

	function hide()
	{
		if (this.m.JSHandle != null)
		{
			this.m.LastActiveModule = null;
			this.m.JSHandle.asyncCall("hide", null);
			this.Tooltip.hide();
		}
	}

	function hideAllDialogs()
	{
		if (this.m.JSHandle != null)
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hideAllDialogs", null);
		}
	}

	function refresh()
	{
		if (this.m.JSHandle != null)
		{
			this.m.LastActiveModule = null;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("refresh", this.m.MainDialogModule.queryData());
		}
	}

	function showLastActiveDialog()
	{
		if (this.m.LastActiveModule == this.m.HireDialogModule)
		{
			this.showHireDialog();
		}
		else
		{
			this.showMainDialog();
		}
	}

	function showMainDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = null;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showMainDialog", this.m.MainDialogModule.queryData());
		}
	}

	function showHireDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.HireDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showHireDialog", this.m.HireDialogModule.queryHireInformation());
		}
	}

	function updateAssets()
	{
		this.m.JSHandle.asyncCall("loadAssetData", this.queryAssetsInformation());
	}

	function onScreenConnected()
	{
		if (this.m.OnConnectedListener != null)
		{
			this.m.OnConnectedListener();
		}
	}

	function onScreenDisconnected()
	{
		if (this.m.OnDisconnectedListener != null)
		{
			this.m.OnDisconnectedListener();
		}
	}

	function onScreenShown()
	{
		this.m.Visible = true;
		this.m.Animating = false;
	}

	function onScreenHidden()
	{
		this.m.Visible = false;
		this.m.Animating = false;
	}

	function onScreenAnimating()
	{
		this.m.Animating = true;
	}

	function onModuleClosed()
	{
		if (this.m.LastActiveModule == this.m.HireDialogModule)
		{
			this.showMainDialog();
		}
		else if (this.m.OnModuleClosedListener != null)
		{
			this.m.OnModuleClosedListener();
		}
	}

	function onSlotClicked( _data )
	{
		if (this.isAnimating())
		{
			return;
		}

		this.m.HireDialogModule.setCurrentSlot(_data);
		this.showHireDialog();
	}

	function queryTownInformation()
	{
		if (this.m.Town == null)
		{
			return;
		}

		return this.m.Town.getUIInformation();
	}

	function queryAssetsInformation()
	{
		return this.UIDataHelper.convertAssetsInformationToUIData();
	}

};

