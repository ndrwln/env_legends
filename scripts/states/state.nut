this.state <- {
	function onInit()
	{
		this.logDebug(this.getName() + "::onInit()");
	}

	function onFinish()
	{
		this.logDebug(this.getName() + "::onFinish()");
	}

	function onHide()
	{
		this.logDebug(this.getName() + "::onHide()");
	}

	function onShow()
	{
		this.logDebug(this.getName() + "::onShow()");
	}

	function onFront()
	{
		this.logDebug(this.getName() + "::onFront()");
	}

	function onBack()
	{
		this.logDebug(this.getName() + "::onBack()");
	}

	function onUpdate()
	{
	}

	function onRender()
	{
	}

	function onKeyInput( _key )
	{
		return false;
	}

	function onMouseInput( _mouse )
	{
		return false;
	}

	function onSerialize( _out )
	{
	}

	function onDeserialize( _in )
	{
	}

};

