::RoamingBeastsContractWeights <- {
	Weights = {
		Default = ::MSU.Class.WeightedContainer([
			[
				50,
				"IsDirewolves"
			],
			[
				50,
				"IsGhouls"
			],
			[
				50,
				"IsSpiders"
			]
		]),
		Lumber = ::MSU.Class.WeightedContainer([
			[
				100,
				"IsDirewolves"
			],
			[
				50,
				"IsGhouls"
			],
			[
				150,
				"IsSpiders"
			]
		]),
		Tundra = ::MSU.Class.WeightedContainer([
			[
				100,
				"IsDirewolves"
			],
			[
				25,
				"IsGhouls"
			],
			[
				25,
				"IsSpiders"
			]
		]),
		Snow = ::MSU.Class.WeightedContainer([
			[
				100,
				"IsDirewolves"
			],
			[
				0,
				"IsGhouls"
			],
			[
				0,
				"IsSpiders"
			]
		]),
		Steppe = ::MSU.Class.WeightedContainer([
			[
				25,
				"IsDirewolves"
			],
			[
				100,
				"IsGhouls"
			],
			[
				25,
				"IsSpiders"
			]
		]),
		Swamp = ::MSU.Class.WeightedContainer([
			[
				25,
				"IsDirewolves"
			],
			[
				100,
				"IsGhouls"
			],
			[
				25,
				"IsSpiders"
			]
		]),
		Farming = ::MSU.Class.WeightedContainer([
			[
				50,
				"IsDirewolves"
			],
			[
				75,
				"IsGhouls"
			],
			[
				50,
				"IsSpiders"
			]
		])
	},
	function rollEnemyBySettlement( _settlement )
	{
		if (::MSU.isKindOf(_settlement, "legends_lumber_village") || ::MSU.isKindOf(_settlement, "small_lumber_village") || ::MSU.isKindOf(_settlement, "medium_lumber_village"))
		{
			return this.Weights.Lumber.roll();
		}
		else if (::MSU.isKindOf(_settlement, "legends_tundra_village") || ::MSU.isKindOf(_settlement, "small_tundra_village") || ::MSU.isKindOf(_settlement, "medium_tundra_village"))
		{
			return this.Weights.Tundra.roll();
		}
		else if (::MSU.isKindOf(_settlement, "legends_snow_village") || ::MSU.isKindOf(_settlement, "small_snow_village") || ::MSU.isKindOf(_settlement, "medium_snow_village"))
		{
			return this.Weights.Snow.roll();
		}
		else if (::MSU.isKindOf(_settlement, "legends_steppe_village") || ::MSU.isKindOf(_settlement, "small_steppe_village") || ::MSU.isKindOf(_settlement, "medium_steppe_village"))
		{
			return this.Weights.Steppe.roll();
		}
		else if (::MSU.isKindOf(_settlement, "legends_swamp_village") || ::MSU.isKindOf(_settlement, "small_swamp_village") || ::MSU.isKindOf(_settlement, "medium_swamp_village"))
		{
			return this.Weights.Swamp.roll();
		}
		else if (::MSU.isKindOf(_settlement, "legends_farming_village") || ::MSU.isKindOf(_settlement, "small_farming_village") || ::MSU.isKindOf(_settlement, "medium_farming_village"))
		{
			return this.Weights.Farming.roll();
		}
		else
		{
			return this.Weights.Default.roll();
		}
	}

};

