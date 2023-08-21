this.dialog_screen <- {
	m = {
		JSHandle = null,
		Visible = null,
		Animating = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null,
		OnScreenShownListener = null,
		OnScreenHiddenListener = null,
		OnOkPressedListener = null,
		OnCancelPressedListener = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		return this.m.Animating != null && this.m.Animating == true;
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
		this.m.OnScreenHiddenListener = null;
		this.m.OnScreenShownListener = null;
		this.m.OnFleePressedListener = null;
		this.m.OnCancelPressedListener = null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
		this.m.JSHandle = this.UI.connect("DialogScreen", this);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show( _title, _text, _doneCallback, _okCallback = null, _cancelCallback = null, _isMonologue = false )
	{
		if (this.m.JSHandle != null && !this.isVisible())
		{
			this.m.OnScreenHiddenListener = _doneCallback;

			if (_okCallback != null)
			{
				this.m.OnOkPressedListener = _okCallback;
			}

			if (_cancelCallback != null)
			{
				this.m.OnCancelPressedListener = _cancelCallback;
			}

			this.Tooltip.hide();
			local data = {
				Title = _title,
				Text = _text,
				IsMonologue = _isMonologue
			};
			this.m.JSHandle.asyncCall("show", data);
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
		this.Tooltip.hide();

		if (this.m.OnScreenShownListener != null)
		{
			this.m.OnScreenShownListener();
		}
	}

	function onScreenHidden()
	{
		this.m.Visible = false;
		this.m.Animating = false;

		if (this.m.OnScreenHiddenListener != null)
		{
			this.m.OnScreenHiddenListener();
		}
	}

	function onScreenAnimating()
	{
		this.m.Animating = true;
	}

	function onOkPressed()
	{
		this.hide();

		if (this.m.OnOkPressedListener != null)
		{
			this.m.OnOkPressedListener();
			this.m.OnOkPressedListener = null;
		}
	}

	function onCancelPressed()
	{
		this.hide();

		if (this.m.OnCancelPressedListener != null)
		{
			this.m.OnCancelPressedListener();
			this.m.OnCancelPressedListener = null;
		}
	}

};

