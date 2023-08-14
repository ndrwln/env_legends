this.ui_module <- {
	m = {
		JSHandle = null,
		Parent = null,
		ID = "",
		Visible = null,
		Animating = null
	},
	function setParent( _p )
	{
		this.m.Parent = _p;
	}

	function queryLoad()
	{
		return null;
	}

	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		return this.m.Animating != null && this.m.Animating == true;
	}

	function isConnected()
	{
		return this.m.JSHandle != null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
	}

	function destroy()
	{
		if (this.m.JSHandle != null)
		{
			this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
		}
	}

	function clear()
	{
	}

	function connectUI( _host )
	{
		this.m.JSHandle = _host.connectToModule(this.m.ID, this);

		if (this.m.JSHandle != null && "onModuleConnected" in this.m.Parent)
		{
			this.m.Parent.onModuleConnected(this);
		}
	}

	function onModuleShown()
	{
		this.m.Visible = true;
		this.m.Animating = false;
	}

	function onModuleHidden()
	{
		this.m.Visible = false;
		this.m.Animating = false;
	}

	function onModuleAnimating()
	{
		this.m.Animating = true;
	}

};

