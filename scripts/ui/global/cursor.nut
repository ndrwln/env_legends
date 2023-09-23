this.cursor <- {
	m = {
		PreviousCursor = null,
		CurrentCursor = null,
		X = null,
		Y = null,
		IsOverUI = null,
		WasOverUI = null
	},
	function getPreviousCursor()
	{
		return this.m.PreviousCursor;
	}

	function getCurrentCursor()
	{
		return this.m.CurrentCursor;
	}

	function getPosition()
	{
		return {
			X = this.m.X,
			Y = this.m.Y
		};
	}

	function getX()
	{
		return this.m.X;
	}

	function getY()
	{
		return this.m.Y;
	}

	function getSize()
	{
		return this.UI.getCursorSize();
	}

	function getOffsets()
	{
		return this.UI.getCursorOffsets();
	}

	function isOverUI()
	{
		return this.m.IsOverUI;
	}

	function wasOverUI()
	{
		return this.m.WasOverUI;
	}

	function isHardwareCursor()
	{
		return this.UI.isCursorHardware();
	}

	function setHardwareCursor( _value, _force = false )
	{
		if (_force == true)
		{
			return this.UI.setCursorHardware(_value);
		}
		else
		{
			local settings = this.Settings.getControlSettings();

			if (settings.UseHardwareCursor == true && _value == true || settings.UseHardwareCursor == false && _value == false)
			{
				return this.UI.setCursorHardware(_value);
			}
		}
	}

	function create()
	{
		this.setCursor(this.Const.UI.Cursor.Hand);
		local settings = this.Settings.getControlSettings();
		this.setHardwareCursor(settings.UseHardwareCursor, true);
	}

	function setPreviousCursor()
	{
		this.i(this.m.PreviousCursor != null);
		this.UI.setCursor(this.m.PreviousCursor);
		this.m.CurrentCursor = this.m.PreviousCursor;
		this.m.PreviousCursor = null;
	}

	function setCursor( _cursor )
	{
		if (this.m.CurrentCursor != _cursor)
		{
			this.m.PreviousCursor = this.m.CurrentCursor;
			this.m.CurrentCursor = _cursor;
			this.UI.setCursor(_cursor);
		}
	}

	function setPosition( _x, _y )
	{
		if (this.m.X != _x || this.m.Y != _y)
		{
			this.m.X = _x;
			this.m.Y = _y;
			local isOverUI = this.UI.setCursorPosition(_x, _y);
			this.m.WasOverUI = this.m.IsOverUI;

			if (isOverUI != this.m.IsOverUI)
			{
				this.m.IsOverUI = isOverUI;
			}
		}
	}

};

