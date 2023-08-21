this.tooltip <- {
	m = {
		JSHandle = null,
		Delay = 150,
		CurrentHoveredEntityId = null,
		OnQueryTileTooltipDataListener = null,
		OnQueryRosterEntityTooltipDataListener = null,
		OnQueryEntityTooltipDataListener = null,
		OnQuerySkillTooltipDataListener = null,
		OnQueryStatusEffectTooltipDataListener = null,
		OnQuerySettlementStatusEffectTooltipDataListener = null,
		OnQueryUIElementTooltipDataListener = null,
		OnQueryUIItemTooltipDataListener = null,
		OnQueryUIPerkTooltipDataListener = null,
		OnQueryFollowerTooltipDataListener = null
	},
	function setCurrentHoveredEntity( _entityId )
	{
		if (_entityId != null)
		{
			this.m.CurrentHoveredEntityId = _entityId;
		}
		else
		{
			this.m.CurrentHoveredEntityId = null;
		}
	}

	function setOnQueryTileTooltipDataListener( _listener )
	{
		this.m.OnQueryTileTooltipDataListener = _listener;
	}

	function setOnQueryRosterEntityTooltipDataListener( _listener )
	{
		this.m.OnQueryRosterEntityTooltipDataListener = _listener;
	}

	function setOnQueryEntityTooltipDataListener( _listener )
	{
		this.m.OnQueryEntityTooltipDataListener = _listener;
	}

	function setOnQuerySkillTooltipDataListener( _listener )
	{
		this.m.OnQuerySkillTooltipDataListener = _listener;
	}

	function setOnQueryStatusEffectTooltipDataListener( _listener )
	{
		this.m.OnQueryStatusEffectTooltipDataListener = _listener;
	}

	function setOnQuerySettlementStatusEffectTooltipDataListener( _listener )
	{
		this.m.OnQuerySettlementStatusEffectTooltipDataListener = _listener;
	}

	function setOnQueryUIElementTooltipDataListener( _listener )
	{
		this.m.OnQueryUIElementTooltipDataListener = _listener;
	}

	function setOnQueryUIItemTooltipDataListener( _listener )
	{
		this.m.OnQueryUIItemTooltipDataListener = _listener;
	}

	function setOnQueryUIPerkTooltipDataListener( _listener )
	{
		this.m.OnQueryUIPerkTooltipDataListener = _listener;
	}

	function setOnQueryFollowerTooltipDataListener( _listener )
	{
		this.m.OnQueryFollowerTooltipDataListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnQueryTileTooltipDataListener = null;
		this.m.OnQueryRosterEntityTooltipDataListener = null;
		this.m.OnQueryEntityTooltipDataListener = null;
		this.m.OnQuerySkillTooltipDataListener = null;
		this.m.OnQuerySettlementStatusEffectTooltipDataListener = null;
		this.m.OnQueryStatusEffectTooltipDataListener = null;
		this.m.OnQueryUIElementTooltipDataListener = null;
		this.m.OnQueryUIItemTooltipDataListener = null;
		this.m.OnQueryUIPerkTooltipDataListener = null;
		this.m.OnQueryFollowerTooltipDataListener = null;
	}

	function create()
	{
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.CurrentHoveredEntityId = null;
		this.m.JSHandle = null;
	}

	function connectUI( _host )
	{
		this.m.JSHandle = _host.connectToModule("TooltipModule", this);
	}

	function mouseEnterTile( _x, _y, _entityId = null )
	{
		local scale = this.Settings.getVideoMode().UIScale;
		_x = _x / scale;
		_y = _y / scale;

		if (_entityId != null)
		{
			this.m.JSHandle.asyncCall("mouseEnterTile", {
				X = _x,
				Y = _y,
				EntityId = _entityId
			});
		}
		else
		{
			this.m.JSHandle.asyncCall("mouseEnterTile", {
				X = _x,
				Y = _y
			});
		}

		this.m.CurrentHoveredEntityId = _entityId;
	}

	function mouseHoverTile( _x, _y )
	{
		local scale = this.Settings.getVideoMode().UIScale;
		_x = _x / scale;
		_y = _y / scale;
		this.m.JSHandle.asyncCall("mouseHoverTile", {
			X = _x,
			Y = _y
		});
	}

	function mouseLeaveTile()
	{
		this.m.JSHandle.asyncCall("mouseLeaveTile", null);
	}

	function reload()
	{
		this.m.JSHandle.asyncCall("reloadTooltip", null);
	}

	function reloadDataIfEqual( _entityId )
	{
		if (_entityId != null)
		{
			if (this.m.CurrentHoveredEntityId == _entityId)
			{
				this.reload();
			}
		}
	}

	function hide()
	{
		this.m.JSHandle.asyncCall("hideTooltip", null);
	}

	function setCursorOffsets( _offsets )
	{
		this.m.JSHandle.asyncCall("setCursorOffsets", _offsets);
	}

	function setDelay( _delay )
	{
		this.m.Delay = _delay;
		this.m.JSHandle.asyncCall("setDelay", _delay);
	}

	function getDelay()
	{
		return this.m.Delay;
	}

	function onQueryTileTooltipData()
	{
		if (this.m.OnQueryTileTooltipDataListener != null)
		{
			return this.m.OnQueryTileTooltipDataListener();
		}

		return null;
	}

	function onQueryEntityTooltipData( _data )
	{
		if (this.m.OnQueryEntityTooltipDataListener != null)
		{
			return this.m.OnQueryEntityTooltipDataListener(_data[0], _data[1]);
		}

		return null;
	}

	function onQueryRosterEntityTooltipData( _data )
	{
		if (this.m.OnQueryRosterEntityTooltipDataListener != null)
		{
			return this.m.OnQueryRosterEntityTooltipDataListener(_data);
		}

		return null;
	}

	function onQuerySkillTooltipData( _data )
	{
		if (this.m.OnQuerySkillTooltipDataListener != null)
		{
			return this.m.OnQuerySkillTooltipDataListener(_data[0], _data[1]);
		}

		return null;
	}

	function onQueryStatusEffectTooltipData( _data )
	{
		if (this.m.OnQueryStatusEffectTooltipDataListener != null)
		{
			return this.m.OnQueryStatusEffectTooltipDataListener(_data[0], _data[1]);
		}

		return null;
	}

	function onQuerySettlementStatusEffectTooltipData( _data )
	{
		if (this.m.OnQuerySettlementStatusEffectTooltipDataListener != null)
		{
			return this.m.OnQuerySettlementStatusEffectTooltipDataListener(_data[0]);
		}

		return null;
	}

	function onQueryUIElementTooltipData( _data )
	{
		if (this.m.OnQueryUIElementTooltipDataListener != null)
		{
			return this.m.OnQueryUIElementTooltipDataListener(_data[0], _data[1], _data[2]);
		}

		return null;
	}

	function onQueryUIItemTooltipData( _data )
	{
		if (this.m.OnQueryUIItemTooltipDataListener != null)
		{
			return this.m.OnQueryUIItemTooltipDataListener(_data[0], _data[1], _data[2]);
		}

		return null;
	}

	function onQueryUIPerkTooltipData( _data )
	{
		if (this.m.OnQueryUIPerkTooltipDataListener != null)
		{
			return this.m.OnQueryUIPerkTooltipDataListener(_data[0], _data[1]);
		}

		return null;
	}

	function onQueryFollowerTooltipData( _data )
	{
		if (this.m.OnQueryFollowerTooltipDataListener != null)
		{
			return this.m.OnQueryFollowerTooltipDataListener(_data);
		}

		return null;
	}

};

