this.arena_faction <- this.inherit("scripts/factions/faction", {
	m = {},
	function create()
	{
		this.faction.create();
		this.m.Type = this.Const.FactionType.Arena;
		this.m.Base = "world_base_10";
		this.m.TacticalBase = "bust_base_beasts";
		this.m.CombatMusic = this.Const.Music.BeastsTracks;
		this.m.Footprints = this.Const.BeastFootprints;
		this.m.PlayerRelation = 0.0;
		this.m.IsHidden = true;
		this.m.IsRelationDecaying = false;
	}

	function addPlayerRelation( _r, _reason = "" )
	{
	}

	function addPlayerRelationEx( _r, _reason = "" )
	{
	}

});

