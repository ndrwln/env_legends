local gt = this.getroottable();
gt.WeakTableRef <- class 
{
	WeakTable = null;
	constructor( _table )
	{
		if (_table != null && typeof _table == "table")
		{
			this.WeakTable = _table.weakref();
		}
	}

	function isNull()
	{
		return this.WeakTable == null;
	}

	function get()
	{
		return this.WeakTable;
	}

	function _get( _index )
	{
		if (_index in this)
		{
			return this[_index];
		}
		else if (this.WeakTable == null)
		{
			throw null;
		}
		else
		{
			local result = this.WeakTable[_index];

			if (result != null && typeof result == "function")
			{
				result = result.bindenv(this.WeakTable);
			}

			return result;
		}
	}

};

