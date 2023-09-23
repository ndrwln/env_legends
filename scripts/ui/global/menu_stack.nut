this.menu_stack <- {
	m = {
		Stack = null,
		Enviroment = null
	},
	function setEnviroment( _value )
	{
		this.m.Enviroment = _value;
	}

	function create()
	{
		this.m.Stack = [];
	}

	function destroy()
	{
		this.popAll(true);
		this.m.Stack = null;
		this.m.Enviroment = null;
	}

	function push( _backstepCallback, _backstepValidationCallback = null, _allowCancel = true )
	{
		if (this.m.Stack.len() > 0 && !this.m.Stack[this.m.Stack.len() - 1].allowCancel)
		{
			return false;
		}

		local backstep = {
			backstepCallback = null,
			backstepValidationCallback = null,
			allowCancel = _allowCancel
		};

		if (typeof _backstepCallback == "function")
		{
			backstep.backstepCallback = this.m.Enviroment != null ? _backstepCallback.bindenv(this.m.Enviroment) : _backstepCallback;
		}

		if (typeof _backstepValidationCallback == "function")
		{
			backstep.backstepValidationCallback = this.m.Enviroment != null ? _backstepValidationCallback.bindenv(this.m.Enviroment) : _backstepValidationCallback;
		}

		if (backstep.backstepCallback != null)
		{
			this.m.Stack.push(backstep);
			return true;
		}

		return false;
	}

	function pop( _ignoreValidator = false )
	{
		if (this.m.Stack == null || this.m.Stack.len() == 0)
		{
			return false;
		}

		local i = this.m.Stack.len() - 1;
		local backstep = this.m.Stack[i];

		if (!_ignoreValidator && backstep.backstepValidationCallback != null)
		{
			if (!backstep.backstepValidationCallback())
			{
				return false;
			}
		}

		this.m.Stack.remove(i);
		backstep.backstepCallback();
		return true;
	}

	function popAll( _ignoreValidator = false )
	{
		do
		{
		}
		while (this.pop(_ignoreValidator));
	}

	function hasBacksteps()
	{
		return this.m.Stack != null && this.m.Stack.len() > 0;
	}

	function isAllowingCancel()
	{
		return this.m.Stack != null && this.m.Stack.len() > 0 && this.m.Stack[this.m.Stack.len() - 1].allowCancel;
	}

};

