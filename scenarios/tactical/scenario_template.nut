this.scenario_template <- {
	m = {
		Music = this.Const.Music.MenuTracks
	},
	function getMusic()
	{
		return this.m.Music;
	}

	function getPlayerName( _index )
	{
		if (_index < 0 || _index >= this.m.PlayerNames.len())
		{
			return this.Const.Strings.CharacterNames[0];
		}
		else
		{
			return this.Const.Strings.CharacterNames[_index];
		}
	}

	function getRandomPlayerName()
	{
		return this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)];
	}

	function generate()
	{
		this.logDebug("ScenarioTemplate::generate()");
	}

	function createStash()
	{
		local globalTable = this.getroottable();
		globalTable.Stash <- this.new("scripts/items/stash_container");
	}

};

