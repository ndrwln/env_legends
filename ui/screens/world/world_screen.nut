this.world_screen <- {
	m = {
		JSHandle = null,
		TopbarDayTimeModule = null,
		TopbarOptionsModule = null,
		TopbarAssetsModule = null,
		TopbarAmbitionModule = null,
		TopbarDatasourceModule = null,
		ActiveContractPanelModule = null,
		Visible = null,
		Animating = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null,
		DevConsoleIsVisible = false
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		return this.m.Animating != null && this.m.Animating == true;
	}

	function devConsoleVisible()
	{
		return this.m.DevConsoleIsVisible != null && this.m.DevConsoleIsVisible == true;
	}

	function getTopbarDayTimeModule()
	{
		return this.m.TopbarDayTimeModule;
	}

	function getTopbarOptionsModule()
	{
		return this.m.TopbarOptionsModule;
	}

	function getTopbarAssetsModule()
	{
		return this.m.TopbarAssetsModule;
	}

	function getTopbarAmbitionModule()
	{
		return this.m.TopbarAmbitionModule;
	}

	function getTopbarDatasourceModule()
	{
		return this.m.TopbarDatasourceModule;
	}

	function getActiveContractPanelModule()
	{
		return this.m.ActiveContractPanelModule;
	}

	function setOnConnectedListener( _listener )
	{
		this.m.OnConnectedListener = _listener;
	}

	function setOnDisconnectedListener( _listener )
	{
		this.m.OnDisconnectedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnConnectedListener = null;
		this.m.OnDisconnectedListener = null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
		this.m.DevConsoleIsVisible = false;
		this.m.JSHandle = this.UI.connect("WorldScreen", this);
		this.m.TopbarDayTimeModule = this.new("scripts/ui/screens/world/modules/topbar/world_screen_topbar_daytime_module");
		this.m.TopbarDayTimeModule.connectUI(this.m.JSHandle);
		this.World.TopbarDayTimeModule <- this.WeakTableRef(this.m.TopbarDayTimeModule);
		this.m.TopbarOptionsModule = this.new("scripts/ui/screens/world/modules/topbar/world_screen_topbar_options_module");
		this.m.TopbarOptionsModule.connectUI(this.m.JSHandle);
		this.World.TopbarOptionsModule <- this.WeakTableRef(this.m.TopbarOptionsModule);
		this.m.TopbarAssetsModule = this.new("scripts/ui/screens/world/modules/topbar/world_screen_topbar_assets_module");
		this.m.TopbarAssetsModule.connectUI(this.m.JSHandle);
		this.World.TopbarAssetsModule <- this.WeakTableRef(this.m.TopbarAssetsModule);
		this.m.TopbarAmbitionModule = this.new("scripts/ui/screens/world/modules/topbar/world_screen_topbar_ambition_module");
		this.m.TopbarAmbitionModule.connectUI(this.m.JSHandle);
		this.World.TopbarAmbitionModule <- this.WeakTableRef(this.m.TopbarAmbitionModule);
		this.m.TopbarDatasourceModule = this.new("scripts/ui/screens/world/modules/topbar/world_screen_topbar_datasource_module");
		this.m.TopbarDatasourceModule.connectUI(this.m.JSHandle);
		this.m.ActiveContractPanelModule = this.new("scripts/ui/screens/world/modules/world_contract_screen/world_active_contract_panel_module");
		this.m.ActiveContractPanelModule.connectUI(this.m.JSHandle);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.TopbarDayTimeModule.destroy();
		this.m.TopbarOptionsModule.destroy();
		this.m.TopbarAssetsModule.destroy();
		this.m.TopbarAmbitionModule.destroy();
		this.m.TopbarDatasourceModule.destroy();
		this.m.ActiveContractPanelModule.destroy();
		this.m.TopbarDayTimeModule = null;
		this.World.TopbarDayTimeModule = null;
		this.m.TopbarOptionsModule = null;
		this.World.TopbarOptionsModule = null;
		this.m.TopbarAssetsModule = null;
		this.World.TopbarAssetsModule = null;
		this.m.TopbarAmbitionModule = null;
		this.World.TopbarAmbitionModule = null;
		this.m.TopbarDatasourceModule = null;
		this.m.ActiveContractPanelModule = null;
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show( _immediately = false )
	{
		if (this.m.JSHandle != null)
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", _immediately);
		}
	}

	function hide( _immediately = false )
	{
		if (this.m.JSHandle != null)
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hide", _immediately);
		}
	}

	function updateTimeInformation()
	{
		this.m.TopbarDatasourceModule.updateTimeInformation();
	}

	function updateAssetsInformation()
	{
		this.m.TopbarDatasourceModule.updateAssetsInformation();
	}

	function updateContract( _contract = null )
	{
		this.m.ActiveContractPanelModule.updateContract(_contract);
	}

	function clearContract()
	{
		this.m.ActiveContractPanelModule.clearContract();
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

	function onDevConsoleCommand( _data )
	{
		this.LegendsMod.onDevConsole(_data[0], _data[1]);
	}

	function onDevConsoleIsVisible( _data )
	{
		this.m.DevConsoleIsVisible = _data[0];
	}

	function showDevConsole( _immediately = false )
	{
		if (this.m.JSHandle != null)
		{
			this.m.JSHandle.asyncCall("showDevConsole", _immediately);
		}
	}

	function hideDevConsole( _immediately = false )
	{
		if (this.m.JSHandle != null)
		{
			this.m.JSHandle.asyncCall("hideDevConsole", _immediately);
		}
	}

};

