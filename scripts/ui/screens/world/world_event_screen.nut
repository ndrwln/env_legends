this.world_event_screen <- {
	m = {
		JSHandle = null,
		Visible = null,
		Animating = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null,
		IsContract = false
	},
	function setIsContract( _c )
	{
		this.m.IsContract = _c;
	}

	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		if (this.m.Animating != null)
		{
			return this.m.Animating == true;
		}
		else
		{
			return false;
		}
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
		this.m.JSHandle = this.UI.connect("WorldEventScreen", this);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show( _event, _withSlideAnimation = false )
	{
		if (this.m.JSHandle != null)
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", this.convertEventToUIData(_event));
			this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _t )
			{
				this.Tooltip.hide();
			}, null);
		}
	}

	function hide( _withSlideAnimation = false )
	{
		if (this.m.JSHandle != null)
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hide", _withSlideAnimation);
		}
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

	function onButtonPressed( _buttonID )
	{
		if (this.m.IsContract)
		{
			this.World.Contracts.processInput(_buttonID);
		}
		else
		{
			this.World.Events.processInput(_buttonID);
		}
	}

	function onScreenShown()
	{
		this.Tooltip.hide();
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

	function convertEventToUIData( _event )
	{
		if (_event == null)
		{
			return null;
		}

		local result = {
			id = _event.getID(),
			title = _event.getUITitle(),
			headerImagePath = null,
			content = _event.getUIContent(),
			buttons = _event.getUIButtons(),
			hasBigButtons = _event.hasBigButtons()
		};
		result.characterLeft <- _event.getUICharacterImage(0);
		result.characterRight <- _event.getUICharacterImage(1);

		if (_event.getUIMiddleOverlay() != null)
		{
			result.overlayMiddle <- _event.getUIMiddleOverlay();
		}

		if (_event.getUIList().len() != 0)
		{
			local lists = _event.getUIList();

			foreach( i, l in lists )
			{
				result.content.push({
					id = 3 + i,
					type = "list",
					title = l.title,
					items = l.items,
					fixed = l.fixed
				});
			}
		}

		return result;
	}

};

