this.credits_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnDoneListener = null
	},
	function setOnDoneListener( _listener )
	{
		this.m.OnDoneListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnDoneListener = null;
	}

	function create()
	{
		this.m.ID = "CreditsModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function show()
	{
		if (!this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function onDone()
	{
		if (this.m.OnDoneListener != null)
		{
			this.m.OnDoneListener();
		}
	}

});

