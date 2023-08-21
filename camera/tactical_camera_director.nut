this.tactical_camera_director <- {
	m = {
		Events = [],
		DelayUntil = 0.0,
		IsPaused = false
	},
	function setPaused( _p )
	{
		this.m.IsPaused = _p;
	}

	function isPaused()
	{
		return this.m.IsPaused;
	}

	function isIdle()
	{
		return this.m.Events.len() == 0;
	}

	function isMoving()
	{
		return this.Tactical.getCamera().isMoving() || !this.isIdle();
	}

	function isInputAllowed()
	{
		return !this.isMoving() && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().isPlayerControlled();
	}

	function isDelayed()
	{
		return this.Time.getVirtualTimeF() < this.m.DelayUntil;
	}

	function create()
	{
	}

	function addDelay( _d )
	{
		if (this.isDelayed())
		{
			this.m.DelayUntil += _d;
		}
		else
		{
			this.m.DelayUntil = this.Time.getVirtualTimeF() + _d;
		}
	}

	function update()
	{
		if (this.m.IsPaused)
		{
			return;
		}

		if (this.m.Events.len() == 0)
		{
			return;
		}

		local camera = this.Tactical.getCamera();

		switch(this.m.Events[0].State)
		{
		case this.Const.Tactical.CameraEventState.Queued:
			if (this.m.Events[0].Time <= this.Time.getVirtualTime())
			{
				if (this.m.Events[0].Type != this.Const.Tactical.CameraEventType.Idle)
				{
					if (this.m.Events[0].Type == this.Const.Tactical.CameraEventType.MoveToIfNotVisible)
					{
						if (camera.isInsideScreen(this.m.Events[0].TargetTile.Pos))
						{
							this.m.Events[0].State = this.Const.Tactical.CameraEventState.WaitOnCallback;
							this.m.Events[0].Time = this.Time.getVirtualTime() + this.m.Events[0].CallbackDelay;
							break;
						}
						else
						{
							this.m.Events[0].Type = this.Const.Tactical.CameraEventType.MoveTo;
						}
					}

					this.m.Events[0].State = this.Const.Tactical.CameraEventState.Focus;
				}
				else
				{
					camera.cancelMovement();
					this.m.Events[0].State = this.Const.Tactical.CameraEventState.WaitOnCallback;
					this.m.Events[0].Time = this.Time.getVirtualTime() + this.m.Events[0].CallbackDelay;
				}
			}

			break;

		case this.Const.Tactical.CameraEventState.Focus:
			if (!camera.isCenteredOnTile(this.m.Events[0].TargetTile) && !camera.isMovingToTile(this.m.Events[0].TargetTile))
			{
				if (this.m.Events[0].Type == this.Const.Tactical.CameraEventType.MoveToSlowly)
				{
					camera.moveToTileSlowly(this.m.Events[0].TargetTile);
				}
				else if (this.m.Events[0].Type == this.Const.Tactical.CameraEventType.MoveTo)
				{
					camera.moveToTile(this.m.Events[0].TargetTile);
				}
				else
				{
					camera.setPos(this.m.Events[0].TargetTile.Pos);
				}

				camera.Level = this.m.Events[0].TargetLevel;
			}
			else
			{
				this.m.Events[0].State = this.Const.Tactical.CameraEventState.WaitOnCallback;
				this.m.Events[0].Time = this.Time.getVirtualTime() + this.m.Events[0].CallbackDelay;
			}

			break;

		case this.Const.Tactical.CameraEventState.WaitOnCallback:
			if (this.m.Events[0].Time <= this.Time.getVirtualTime())
			{
				if (this.m.Events[0].Callback != null)
				{
					this.m.Events[0].Callback(this.m.Events[0].Tag);
				}

				this.m.Events[0].State = this.Const.Tactical.CameraEventState.WaitOnFinalization;
				this.m.Events[0].Time = this.Time.getVirtualTime() + this.m.Events[0].FinalDelay;
			}

			break;

		case this.Const.Tactical.CameraEventState.WaitOnFinalization:
			if (this.m.Events[0].Time <= this.Time.getVirtualTime())
			{
				this.m.Events.remove(0);
			}

			break;
		}
	}

	function clear()
	{
		this.m.Events = [];
		this.Tactical.getCamera().cancelMovement();
	}

	function addMoveSlowlyToTileEvent( _delay, _targetTile, _targetLevel = -1, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		if (_targetLevel == -1)
		{
			_targetLevel = this.Tactical.getCamera().getBestLevelForTile(_targetTile);
		}

		local event = {
			Type = this.Const.Tactical.CameraEventType.MoveToSlowly,
			State = this.Const.Tactical.CameraEventState.Queued,
			TargetTile = _targetTile,
			TargetLevel = _targetLevel,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.push(event);
	}

	function addMoveToTileEvent( _delay, _targetTile, _targetLevel = -1, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		if (_targetLevel == -1)
		{
			_targetLevel = this.Tactical.getCamera().getBestLevelForTile(_targetTile);
		}

		local event = {
			Type = this.Const.Tactical.CameraEventType.MoveTo,
			State = this.Const.Tactical.CameraEventState.Queued,
			TargetTile = _targetTile,
			TargetLevel = _targetLevel,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.push(event);
	}

	function addMoveToTileEventIfNotVisible( _delay, _targetTile, _targetLevel = -1, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		if (_targetLevel == -1)
		{
			_targetLevel = this.Tactical.getCamera().getBestLevelForTile(_targetTile);
		}

		local event = {
			Type = this.Const.Tactical.CameraEventType.MoveToIfNotVisible,
			State = this.Const.Tactical.CameraEventState.Queued,
			TargetTile = _targetTile,
			TargetLevel = _targetLevel,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.push(event);
	}

	function pushMoveToTileEvent( _delay, _targetTile, _targetLevel = -1, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		if (_targetLevel == -1)
		{
			_targetLevel = this.Tactical.getCamera().getBestLevelForTile(_targetTile);
		}

		local event = {
			Type = this.Const.Tactical.CameraEventType.MoveTo,
			State = this.Const.Tactical.CameraEventState.Queued,
			TargetTile = _targetTile,
			TargetLevel = _targetLevel,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.insert(0, event);
	}

	function addJumpToTileEvent( _delay, _targetTile, _targetLevel = -1, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		if (_targetLevel == -1)
		{
			_targetLevel = this.Tactical.getCamera().getBestLevelForTile(_targetTile);
		}

		local event = {
			Type = this.Const.Tactical.CameraEventType.JumpTo,
			State = this.Const.Tactical.CameraEventState.Queued,
			TargetTile = _targetTile,
			TargetLevel = _targetLevel,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.push(event);
	}

	function addIdleEvent( _delay, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		local event = {
			Type = this.Const.Tactical.CameraEventType.Idle,
			State = this.Const.Tactical.CameraEventState.Queued,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.push(event);
	}

	function pushIdleEvent( _delay, _callback = null, _tag = null, _callbackDelay = 0, _finalDelay = 0 )
	{
		local event = {
			Type = this.Const.Tactical.CameraEventType.MoveTo,
			State = this.Const.Tactical.CameraEventState.Queued,
			TargetTile = this._targetTile,
			TargetLevel = this._targetLevel,
			Time = this.Time.getVirtualTime() + _delay,
			Callback = _callback,
			Tag = _tag,
			CallbackDelay = _callbackDelay,
			FinalDelay = _finalDelay
		};
		this.m.Events.insert(0, event);
	}

};

