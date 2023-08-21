this.tag_collection <- {
	m = {},
	function add( _tag, _value = 0 )
	{
		if (!this.m.rawin(_tag))
		{
			this.m.rawset(_tag, {
				Key = _tag,
				Value = _value
			});
		}
	}

	function increment( _tag, _value = 1 )
	{
		if (!this.m.rawin(_tag))
		{
			this.m.rawset(_tag, {
				Key = _tag,
				Value = _value
			});
		}
		else
		{
			this.m.rawset(_tag, {
				Key = _tag,
				Value = this.m.rawget(_tag).Value + _value
			});
		}
	}

	function set( _tag, _value )
	{
		this.m.rawset(_tag, {
			Key = _tag,
			Value = _value
		});
	}

	function remove( _tag )
	{
		this.m.rawdelete(_tag);
	}

	function has( _tag )
	{
		return this.m.rawin(_tag);
	}

	function get( _tag )
	{
		if (this.m.rawin(_tag))
		{
			return this.m.rawget(_tag).Value;
		}
		else
		{
			return false;
		}
	}

	function getAsInt( _tag )
	{
		if (this.m.rawin(_tag))
		{
			return this.m.rawget(_tag).Value;
		}
		else
		{
			return 0;
		}
	}

	function getAsFloat( _tag )
	{
		if (this.m.rawin(_tag))
		{
			return this.m.rawget(_tag).Value;
		}
		else
		{
			return 0.0;
		}
	}

	function onSerialize( _out )
	{
		_out.writeU16(this.m.len());

		foreach( v in this.m )
		{
			_out.writeString(v.Key);
			local type = typeof v.Value;

			if (type == "integer")
			{
				_out.writeU8(0);
				_out.writeI32(v.Value);
			}
			else if (type == "float")
			{
				_out.writeU8(1);
				_out.writeF32(v.Value);
			}
			else if (type == "bool")
			{
				_out.writeU8(2);
				_out.writeBool(v.Value);
			}
			else
			{
				_out.writeU8(3);
				_out.writeString(v.Value);
			}
		}
	}

	function onDeserialize( _in, _clearCurrent = true )
	{
		if (_clearCurrent)
		{
			this.m = {};
		}

		local num = _in.readU16();

		for( local i = 0; i < num; i = ++i )
		{
			local key = _in.readString();
			local type = _in.readU8();
			local value;

			if (type == 0)
			{
				value = _in.readI32();
			}
			else if (type == 1)
			{
				value = _in.readF32();
			}
			else if (type == 2)
			{
				value = _in.readBool();
			}
			else
			{
				value = _in.readString();
			}

			this.set(key, value);
		}
	}

};

