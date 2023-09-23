this.world_screen_topbar_options_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnBrothersPressedListener = null,
		OnActiveContractPressedListener = null,
		OnRelationsPressedListener = null,
		OnPerksPressedListener = null,
		OnObituaryPressedListener = null,
		OnQuitPressedListener = null
	},
	function setOnBrothersPressedListener( _listener )
	{
		this.m.OnBrothersPressedListener = _listener;
	}

	function setOnActiveContractPressedListener( _listener )
	{
		this.m.OnActiveContractPressedListener = _listener;
	}

	function setOnRelationsPressedListener( _listener )
	{
		this.m.OnRelationsPressedListener = _listener;
	}

	function setOnObituaryPressedListener( _listener )
	{
		this.m.OnObituaryPressedListener = _listener;
	}

	function setOnPerksPressedListener( _listener )
	{
		this.m.OnPerksPressedListener = _listener;
	}

	function setOnQuitPressedListener( _listener )
	{
		this.m.OnQuitPressedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnBrothersPressedListener = null;
		this.m.OnActiveContractPressedListener = null;
		this.m.OnRelationsPressedListener = null;
		this.m.OnPerksPressedListener = null;
		this.m.OnObituaryPressedListener = null;
		this.m.OnQuitPressedListener = null;
	}

	function create()
	{
		this.m.ID = "TopbarOptionsModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function enableCampButton( _enabled )
	{
		this.m.JSHandle.asyncCall("enableCampButton", _enabled);
	}

	function enablePerksButton( _enabled )
	{
		this.m.JSHandle.asyncCall("enablePerksButton", _enabled);
	}

	function onBrothersButtonPressed()
	{
		if (this.m.OnBrothersPressedListener != null)
		{
			this.m.OnBrothersPressedListener();
		}
	}

	function onActiveContractButtonPressed()
	{
		if (this.m.OnActiveContractPressedListener != null)
		{
			this.m.OnActiveContractPressedListener();
		}
	}

	function onRelationsButtonPressed()
	{
		if (this.m.OnRelationsPressedListener != null)
		{
			this.m.OnRelationsPressedListener();
		}
	}

	function onPerksButtonPressed()
	{
		if (this.m.OnPerksPressedListener != null)
		{
			this.m.OnPerksPressedListener();
		}
	}

	function onObituaryButtonPressed()
	{
		if (this.m.OnObituaryPressedListener != null)
		{
			this.m.OnObituaryPressedListener();
		}
	}

	function onCampButtonPressed()
	{
		this.World.State.showCampScreen();
	}

	function onCenterButtonPressed()
	{
		this.World.getCamera().Zoom = 1.0;
		this.World.getCamera().setPos(this.World.State.getPlayer().getPos());
	}

	function onCameraLockButtonPressed()
	{
		this.Settings.getTempGameplaySettings().CameraLocked = !this.Settings.getTempGameplaySettings().CameraLocked;
		this.m.JSHandle.asyncCall("updateCameraLockButton", this.Settings.getTempGameplaySettings().CameraLocked);
	}

	function onTrackingButtonPressed()
	{
		this.Settings.getTempGameplaySettings().ShowTracking = !this.Settings.getTempGameplaySettings().ShowTracking;
		this.m.JSHandle.asyncCall("updateTrackingButton", this.Settings.getTempGameplaySettings().ShowTracking);
	}

	function onQuitButtonPressed()
	{
		if (this.m.OnQuitPressedListener != null)
		{
			this.m.OnQuitPressedListener();
		}
	}

});

