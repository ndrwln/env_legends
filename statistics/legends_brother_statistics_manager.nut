this.legends_brother_statistics_manager <- {
	m = {
		ActorInteractions = null,
		IDToRef = this.array(27, -1)
	},
	function create()
	{
		this.m.IDToRef <- this.array(27);
		this.m.ActorInteractions <- this.array(27);

		foreach( subarr in this.m.ActorInteractions )
		{
			subarr = this.array(27);
		}
	}

	function addNewActorID( _actor )
	{
		for( local i = 0; i < 27; i++ )
		{
			if (this.m.IDToRef[i] == -1)
			{
				this.m.IDToRef[i] = this.WeakTableRef(_actor);
				return i;
			}
		}
	}

	function removeActorID( _id )
	{
		this.m.IDToRef[_id] = -1;
	}

	function idExists( _id )
	{
		return !(this.m.IDToRef[_id] == -1);
	}

	function getRefFromID( _id )
	{
		if (_id == -1)
		{
			return null;
		}

		if (_id > this.m.IDToRef.len() - 1)
		{
			return null;
		}

		local val = this.m.IDToRef[_id];

		if (val == -1)
		{
			return null;
		}

		return val;
	}

	function incrementForAll( _key, _val = 1 )
	{
		for( local i = 0; i < 27; i = ++i )
		{
			for( local j = i + 1; j < 27; j = ++j )
			{
				this.m.ActorInteractions[i][j].incrementKey(_key, _val);
			}
		}
	}

	function addInteraction( _id )
	{
		for( local i = 0; i < _id - 1; i = ++i )
		{
			if (this.idExists(i))
			{
				this.m.ActorInteractions[_id - 1][i] = this.new("scripts/statistics/legends_actor_interaction");
			}
		}

		for( local i = _id; i < 27; i = ++i )
		{
			if (this.idExists(i))
			{
				this.m.ActorInteractions[i][_id - 1] = this.new("scripts/statistics/legends_actor_interaction");
			}
		}
	}

	function removeInteraction( _id )
	{
		for( local i = 0; i < 27; i = ++i )
		{
			this.m.ActorInteractions[i][_id - 1] = null;
			this.m.ActorInteractions[_id - 1][i] = null;
		}
	}

	function getInteractionBetween( _id1, _id2 )
	{
		return _id1 < _id2 ? this.m.ActorInteractions[_id1][_id2] : this.m.ActorInteractions[_id2][_id1];
	}

	function onDeserialize( _in )
	{
		local i = _in.readU8();
		local j = _in.readU8();

		while (!(i == j == 0))
		{
			this.m.ActorInteractions[i][j] = this.new("scripts/statistics/legends_actor_interactions");
			this.m.ActorInteractions.onDeserialize(_in);
			i = _in.readU8();
			j = _in.readU8();
		}

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			this.m.IDToRef[bro.getCompanyID()] = this.WeakTableRef(bro);
		}
	}

	function onSerialize( _out )
	{
		for( local i = 0; i < 27; i = ++i )
		{
			for( local j = i + 1; i < 27; j = ++j )
			{
				if (this.m.ActorInteractions[i][j] != null)
				{
					_out.writeU8(i);
					_out.writeU8(j);
					this.m.ActorInteractions[i][j].onSerialize(_out);
				}
			}
		}

		_out.writeU8(0);
		_out.writeU8(0);
	}

};

