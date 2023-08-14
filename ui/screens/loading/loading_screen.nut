this.loading_screen <- {
	m = {
		JSHandle = null,
		Visible = null,
		Animating = null,
		OnScreenShownListener = null,
		OnScreenHiddenListener = null,
		OnQueryDataListener = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		return this.m.Animating != null && this.m.Animating == true;
	}

	function setOnScreenShownListener( _listener )
	{
		this.m.OnScreenShownListener = _listener;
	}

	function setOnScreenHiddenListener( _listener )
	{
		this.m.OnScreenHiddenListener = _listener;
	}

	function setOnQueryDataListener( _listener )
	{
		this.m.OnQueryDataListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnScreenShownListener = null;
		this.m.OnScreenHiddenListener = null;
		this.m.OnQueryDataListener = null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
		this.m.JSHandle = this.UI.connect("LoadingScreen", this);
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show()
	{
		if (!this.isVisible() && !this.isAnimating())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", this.onQueryData());
		}
	}

	function hide()
	{
		if (this.isVisible() && !this.isAnimating())
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function onScreenShown()
	{
		this.m.Visible = true;
		this.m.Animating = false;

		if (this.m.OnScreenShownListener != null)
		{
			this.m.OnScreenShownListener();
		}
	}

	function updateProgress( _text )
	{
		this.m.JSHandle.asyncCall("updateProgress", _text);
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

	function onQueryData()
	{
		if (this.m.OnQueryDataListener != null)
		{
			return this.m.OnQueryDataListener();
		}

		return null;
	}

};

