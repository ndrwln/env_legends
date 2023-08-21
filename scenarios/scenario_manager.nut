this.scenario_manager <- {
	m = {
		Scenarios = []
	},
	function create()
	{
		local scriptFiles = this.IO.enumerateFiles("scripts/scenarios/world");

		foreach( i, scriptFile in scriptFiles )
		{
			if (scriptFile == "scripts/scenarios/world/starting_scenario")
			{
				continue;
			}

			local s = this.new(scriptFile);

			if (s.isValid() && (this.Const.DLC.Wildmen || this.m.Scenarios.len() < 3 + (this.Const.DLC.Desert ? 3 : 0) + (this.Const.DLC.Paladins ? 2 : 0)))
			{
				this.m.Scenarios.push(s);
			}
		}

		this.m.Scenarios.sort(this.onOrderCompare);
	}

	function getScenario( _id )
	{
		foreach( s in this.m.Scenarios )
		{
			if (s.getID() == _id)
			{
				return s;
			}
		}

		return null;
	}

	function getRandomScenario()
	{
		local c = [];

		foreach( s in this.m.Scenarios )
		{
			if (!s.isValid() || s.getID() == "scenario.random")
			{
				continue;
			}

			c.push(s);
		}

		return c[this.Math.rand(0, c.len() - 1)];
	}

	function getScenariosForUI()
	{
		local ret = [];

		foreach( s in this.m.Scenarios )
		{
			if (!s.isValid())
			{
				continue;
			}

			local scenario = {
				ID = s.getID(),
				Name = s.getName(),
				Description = s.getDescription(),
				Difficulty = s.getDifficultyForUI()
			};
			ret.push(scenario);
		}

		return ret;
	}

	function onOrderCompare( _t1, _t2 )
	{
		if (_t1.getOrder() < _t2.getOrder())
		{
			return -1;
		}
		else if (_t1.getOrder() > _t2.getOrder())
		{
			return 1;
		}

		return 0;
	}

};

