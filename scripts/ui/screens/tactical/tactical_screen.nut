this.tactical_screen <- {
	m = {
		JSHandle = null,
		TurnSequenceBar = null,
		OrientationOverlay = null,
		TopbarRoundInformation = null,
		TopbarEventLog = null,
		TopbarOptions = null,
		Visible = null,
		Animating = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		return this.m.Animating != null && this.m.Animating == true;
	}

	function getTurnSequenceBarModule()
	{
		return this.m.TurnSequenceBar;
	}

	function getTopbarRoundInformationModule()
	{
		return this.m.TopbarRoundInformation;
	}

	function getEventLogModule()
	{
		return this.m.TopbarEventLog;
	}

	function getTopbarOptionsModule()
	{
		return this.m.TopbarOptions;
	}

	function getOrientationOverlayModule()
	{
		return this.m.OrientationOverlay;
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
		this.m.TurnSequenceBar = this.new("scripts/ui/screens/tactical/modules/turn_sequence_bar/turn_sequence_bar");
		this.m.TurnSequenceBar.setParent(this);
		this.Tactical.TurnSequenceBar <- this.WeakTableRef(this.m.TurnSequenceBar);
		this.m.OrientationOverlay = this.new("scripts/ui/screens/tactical/modules/orientation_overlay/orientation_overlay");
		this.m.OrientationOverlay.setParent(this);
		this.Tactical.OrientationOverlay <- this.WeakTableRef(this.m.OrientationOverlay);
		this.m.TopbarRoundInformation = this.new("scripts/ui/screens/tactical/modules/topbar/tactical_screen_topbar_round_information");
		this.m.TopbarRoundInformation.setParent(this);
		this.Tactical.TopbarRoundInformation <- this.WeakTableRef(this.m.TopbarRoundInformation);
		this.m.TopbarEventLog = this.new("scripts/ui/screens/tactical/modules/topbar/tactical_screen_topbar_event_log");
		this.m.TopbarEventLog.setParent(this);
		this.Tactical.EventLog <- this.WeakTableRef(this.m.TopbarEventLog);
		this.m.TopbarOptions = this.new("scripts/ui/screens/tactical/modules/topbar/tactical_screen_topbar_options");
		this.m.TopbarOptions.setParent(this);
		this.Tactical.TopbarOptions <- this.WeakTableRef(this.m.TopbarOptions);
	}

	function connect()
	{
		this.m.JSHandle = this.UI.connect("TacticalScreen", this);
		this.m.TurnSequenceBar.connectUI(this.m.JSHandle);
		this.m.OrientationOverlay.connectUI(this.m.JSHandle);
		this.m.TopbarRoundInformation.connectUI(this.m.JSHandle);
		this.m.TopbarEventLog.connectUI(this.m.JSHandle);
		this.m.TopbarOptions.connectUI(this.m.JSHandle);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.TurnSequenceBar.destroy();
		this.m.TopbarRoundInformation.destroy();
		this.m.TopbarEventLog.destroy();
		this.m.TopbarOptions.destroy();
		this.m.OrientationOverlay.destroy();
		this.m.TurnSequenceBar = null;
		this.Tactical.TurnSequenceBar = null;
		this.m.TopbarRoundInformation = null;
		this.Tactical.TopbarRoundInformation = null;
		this.m.TopbarEventLog = null;
		this.Tactical.EventLog = null;
		this.m.TopbarOptions = null;
		this.Tactical.TopbarOptions = null;
		this.m.OrientationOverlay = null;
		this.Tactical.OrientationOverlay = null;
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show()
	{
		if (this.m.JSHandle != null && !this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function onScreenConnected()
	{
	}

	function onModuleConnected( _module )
	{
		if (this.m.TurnSequenceBar.isConnected() && this.m.OrientationOverlay.isConnected() && this.m.TopbarRoundInformation.isConnected() && this.m.TopbarRoundInformation.isConnected() && this.m.TopbarEventLog.isConnected() && this.m.TopbarOptions.isConnected())
		{
			if (this.m.OnConnectedListener != null)
			{
				this.m.OnConnectedListener();
			}
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

};

