this.dummy_faction <- this.inherit("scripts/factions/faction", {
	m = {
		MimicID = ::Const.Faction.None
	},
	function create()
	{
		this.faction.create();
		this.m.Type = this.Const.FactionType.DummyFaction;
		this.m.PlayerRelation = -200.0;
		this.m.IsHidden = true;
		this.m.IsRelationDecaying = false;
	}

	function setMimicValues( _factionID, _forceReset = true )
	{
		if (_factionID == null)
		{
			return;
		}

		if (_factionID != ::Const.Faction.None && _factionID != this.getMimicID() && this.getMimicID() != ::Const.Faction.None)
		{
			::logWarning("Attempting to set Dummy Faction to mimic faction with ID = [" + _factionID + "] when it is still mimicking faction with ID = [" + this.getMimicID() + "]");

			if (_forceReset)
			{
				this.reset();
			}
		}

		if (_factionID == this.getID())
		{
			::logError("Attempted to set Dummy Faction to mimic itself");
			return;
		}

		if (_factionID == ::Const.Faction.None)
		{
			this.m.MimicID = ::Const.Faction.None;
			this.m.Base = "";
			this.m.TacticalBase = "";
			this.m.CombatMusic = [];
			this.m.BannerPrefix = "";
			this.m.Banner = 1;
			return;
		}
		else if (::MSU.isNull(::World.FactionManager.getFaction(_factionID)))
		{
			::logWarning("Attempted to set Dummy Faction to mimic empty faction with ID = [" + _factionID + "]");
			return;
		}
		else
		{
			::Legends.Mod.Debug.printLog("Setting Dummy Faction to mimic faction with ID = [" + _factionID + "]");
			local faction = ::World.FactionManager.getFaction(_factionID);
			this.m.MimicID = _factionID;
			this.m.Base = faction.m.Base;
			this.m.TacticalBase = faction.m.TacticalBase;
			this.m.CombatMusic = clone faction.m.CombatMusic;
			this.m.BannerPrefix = faction.m.BannerPrefix;
			this.m.Banner = faction.m.Banner;
			return;
		}
	}

	function getMimicID()
	{
		return this.m.MimicID;
	}

	function reset()
	{
		local faction = ::World.FactionManager.getFaction(this.getMimicID());

		if (!::MSU.isNull(faction))
		{
			local units = clone this.getUnits();

			foreach( i, u in units )
			{
				faction.addUnit(u);
				this.removeUnit(u);
			}
		}

		this.setMimicValues(::Const.Faction.None);
	}

	function addPlayerRelation( _r, _reason = "" )
	{
	}

	function addPlayerRelationEx( _r, _reason = "" )
	{
	}

	function onSerialize( _out )
	{
		this.faction.onSerialize(_out);
		_out.writeU8(this.m.MimicID);
	}

	function onDeserialize( _in )
	{
		this.faction.onDeserialize(_in);
		this.m.MimicID = _in.readU8();
	}

});

