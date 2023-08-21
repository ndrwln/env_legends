this.tactical_screen_topbar_event_log <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "TopbarEventLogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function log_newline()
	{
		this.m.JSHandle.asyncCall("log", "\n");
	}

	function logEx( _text )
	{
		this.m.JSHandle.asyncCall("log", _text);
	}

	function log( _text )
	{
		this.m.JSHandle.asyncCall("log", "\n" + _text);
	}

	function clear()
	{
		this.m.JSHandle.asyncCall("clear", null);
	}

});

