local gt = this.getroottable();

if (!("Perks" in gt.Const))
{
	gt.Const.Perks <- {};
}

local VanillaTree = [
	[
		gt.Const.Perks.PerkDefs.FastAdaption,
		gt.Const.Perks.PerkDefs.CripplingStrikes,
		gt.Const.Perks.PerkDefs.Colossus,
		gt.Const.Perks.PerkDefs.BagsAndBelts,
		gt.Const.Perks.PerkDefs.NineLives,
		gt.Const.Perks.PerkDefs.Pathfinder,
		gt.Const.Perks.PerkDefs.Adrenaline,
		gt.Const.Perks.PerkDefs.Recover,
		gt.Const.Perks.PerkDefs.Student
	],
	[
		gt.Const.Perks.PerkDefs.CoupDeGrace,
		gt.Const.Perks.PerkDefs.Bullseye,
		gt.Const.Perks.PerkDefs.Dodge,
		gt.Const.Perks.PerkDefs.FortifiedMind,
		gt.Const.Perks.PerkDefs.HoldOut,
		gt.Const.Perks.PerkDefs.SteelBrow,
		gt.Const.Perks.PerkDefs.QuickHands,
		gt.Const.Perks.PerkDefs.Gifted
	],
	[
		gt.Const.Perks.PerkDefs.Backstabber,
		gt.Const.Perks.PerkDefs.Anticipation,
		gt.Const.Perks.PerkDefs.ShieldExpert,
		gt.Const.Perks.PerkDefs.Brawny,
		gt.Const.Perks.PerkDefs.Relentless,
		gt.Const.Perks.PerkDefs.Rotation,
		gt.Const.Perks.PerkDefs.RallyTheTroops,
		gt.Const.Perks.PerkDefs.Taunt
	],
	[
		gt.Const.Perks.PerkDefs.SpecMace,
		gt.Const.Perks.PerkDefs.SpecFlail,
		gt.Const.Perks.PerkDefs.SpecHammer,
		gt.Const.Perks.PerkDefs.SpecAxe,
		gt.Const.Perks.PerkDefs.SpecCleaver,
		gt.Const.Perks.PerkDefs.SpecSword,
		gt.Const.Perks.PerkDefs.LegendSpecGreatSword,
		gt.Const.Perks.PerkDefs.SpecDagger,
		gt.Const.Perks.PerkDefs.SpecPolearm,
		gt.Const.Perks.PerkDefs.SpecSpear,
		gt.Const.Perks.PerkDefs.SpecCrossbow,
		gt.Const.Perks.PerkDefs.SpecBow,
		gt.Const.Perks.PerkDefs.SpecThrowing
	],
	[
		gt.Const.Perks.PerkDefs.Underdog,
		gt.Const.Perks.PerkDefs.LoneWolf,
		gt.Const.Perks.PerkDefs.ReachAdvantage,
		gt.Const.Perks.PerkDefs.Overwhelm,
		gt.Const.Perks.PerkDefs.Footwork
	],
	[
		gt.Const.Perks.PerkDefs.HeadHunter,
		gt.Const.Perks.PerkDefs.Berserk,
		gt.Const.Perks.PerkDefs.Nimble,
		gt.Const.Perks.PerkDefs.BattleForged
	],
	[
		gt.Const.Perks.PerkDefs.Fearsome,
		gt.Const.Perks.PerkDefs.Duelist,
		gt.Const.Perks.PerkDefs.KillingFrenzy,
		gt.Const.Perks.PerkDefs.Indomitable
	],
	[],
	[],
	[],
	[]
];
gt.Const.Perks.DefaultCustomPerkTree <- VanillaTree;
gt.Const.Perks.BuildPerkTreeFromTemplate <- function ( _custom )
{
	local tree = [];
	local treeMap = {};

	for( local row = 0; row < VanillaTree.len(); row = row )
	{
		local rowL = [];

		for( local i = 0; i < VanillaTree[row].len(); i = i )
		{
			local perk = clone this.Const.Perks.PerkDefObjects[VanillaTree[row][i]];
			perk.Row <- row;
			perk.Unlocks <- row;
			rowL.push(perk);
			treeMap[perk.ID] <- perk;
			i = ++i;
		}

		for( local i = 0; i < _custom[row].len(); i = i )
		{
			local perk = clone this.Const.Perks.PerkDefObjects[_custom[row][i]];
			perk.Row <- row;
			perk.Unlocks <- row;
			rowL.push(perk);
			treeMap[perk.ID] <- perk;
			i = ++i;
		}

		tree.push(rowL);
		row = ++row;
	}

	return {
		Tree = tree,
		Map = treeMap
	};
};
gt.Const.Perks.BuildCustomPerkTree <- function ( _custom )
{
	local pT = {
		Tree = [],
		Map = {}
	};
	pT.addPerk <- function ( _perk, _row = 0 )
	{
		local perk = clone this.Const.Perks.PerkDefObjects[_perk];

		if (perk.ID in this.Map)
		{
			return;
		}

		perk.Row <- _row;
		perk.Unlocks <- _row;
		perk.IsRefundable <- true;

		for( local i = this.Tree.len(); i < _row + 1; i = i )
		{
			this.Tree.push([]);
			i = ++i;
		}

		this.Tree[_row].push(perk);
		this.Map[perk.ID] <- perk;
	};
	pT.addTree <- function ( _tree )
	{
		foreach( i, row in _tree )
		{
			foreach( p in row )
			{
				this.addPerk(p, i);
			}
		}
	};

	for( local row = 0; row < _custom.len(); row = row )
	{
		for( local i = 0; i < _custom[row].len(); i = i )
		{
			pT.addPerk(_custom[row][i], row);
			i = ++i;
		}

		row = ++row;
	}

	return pT;
};
gt.Const.Perks.GetDynamicPerkTree <- function ( _mins, _map )
{
	local tree = [
		[],
		[],
		[],
		[],
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	];
	local attributes = this.Const.Perks.TraitsTrees.getBaseAttributes();
	local _localMap = {
		Weapon = [],
		Defense = [],
		Traits = [],
		Enemy = [],
		Class = [],
		Magic = []
	};

	if ("Weapon" in _map)
	{
		foreach( p in _map.Weapon )
		{
			_localMap.Weapon.push(p);
		}
	}

	if ("Defense" in _map)
	{
		foreach( p in _map.Defense )
		{
			_localMap.Defense.push(p);
		}
	}

	if ("Traits" in _map)
	{
		foreach( p in _map.Traits )
		{
			_localMap.Traits.push(p);
		}
	}

	if ("Enemy" in _map)
	{
		foreach( p in _map.Enemy )
		{
			_localMap.Enemy.push(p);
		}
	}

	if ("Class" in _map)
	{
		foreach( p in _map.Class )
		{
			_localMap.Class.push(p);
		}
	}

	if ("Magic" in _map)
	{
		foreach( p in _map.Magic )
		{
			_localMap.Magic.push(p);
		}
	}

	local count = _mins.Weapon - _localMap.Weapon.len();

	for( local i = 0; i < count; i = i )
	{
		local _exclude = [];

		foreach( tt in _localMap.Weapon )
		{
			_exclude.push(tt.ID);
		}

		local t = this.Const.Perks.WeaponTrees.getRandom(_exclude);
		_localMap.Weapon.push(t);
		i = ++i;
	}

	local count = _mins.Defense - _localMap.Defense.len();

	for( local i = 0; i < count; i = i )
	{
		local _exclude = [];

		foreach( tt in _localMap.Defense )
		{
			_exclude.push(tt.ID);
		}

		local t = this.Const.Perks.DefenseTrees.getRandom(_exclude);
		_localMap.Defense.push(t);
		i = ++i;
	}

	local count = _mins.Traits - _localMap.Traits.len();

	for( local i = 0; i < count; i = i )
	{
		local _exclude = [];

		foreach( tt in _localMap.Traits )
		{
			_exclude.push(tt.ID);
		}

		local t = this.Const.Perks.TraitsTrees.getRandom(_exclude);
		_localMap.Traits.push(t);
		i = ++i;
	}

	local count = _mins.Enemy - _localMap.Enemy.len();

	for( local i = 0; i <= count; i = i )
	{
		local r = this.Math.rand(0, 100);

		if (r > _mins.EnemyChance * 100.0)
		{
		}
		else
		{
			local _exclude = [];

			foreach( tt in _localMap.Enemy )
			{
				_exclude.push(tt.ID);
			}

			local t = this.Const.Perks.EnemyTrees.getRandom(_exclude);
			_localMap.Enemy.push(t);
		}

		i = ++i;
	}

	local count = _mins.Class - _localMap.Class.len();

	for( local i = 0; i <= count; i = i )
	{
		local r = this.Math.rand(0, 100);

		if (r > _mins.ClassChance * 100.0)
		{
		}
		else
		{
			local _exclude = [];

			foreach( tt in _localMap.Class )
			{
				_exclude.push(tt.ID);
			}

			local t = this.Const.Perks.ClassTrees.getRandom(_exclude);
			_localMap.Class.push(t);
		}

		i = ++i;
	}

	local count = _mins.Magic - _localMap.Magic.len();

	for( local i = 0; i <= count; i = i )
	{
		local r = this.Math.rand(0, 100);

		if (r > _mins.MagicChance * 100.0)
		{
		}
		else
		{
			local _exclude = [];

			foreach( tt in _localMap.Magic )
			{
				_exclude.push(tt.ID);
			}

			local t = this.Const.Perks.MagicTrees.getRandom(_exclude);

			if (this.LegendsMod.Configs().LegendMagicEnabled())
			{
				_localMap.Magic.push(t);
			}
		}

		i = ++i;
	}

	local _totals = {};
	local _overflows = {};

	foreach( v in _localMap )
	{
		foreach( mT in v )
		{
			foreach( i, row in mT.Tree )
			{
				if (!(i in _totals))
				{
					_totals[i] <- 0;
					_overflows[i] <- [];
				}

				foreach( j, p in row )
				{
					for( ; _totals[i] >= 13;  )
					{
						_overflows[i].push(p);
					}

					_totals[i]++;
					tree[i].push(p);
				}
			}
		}
	}

	foreach( index, L in _overflows )
	{
		local nextIndex = index;
		local foundIndexToSlot = true;

		for( local i = 0; i < L.len(); i = i )
		{
			while (nextIndex < 7 && _totals[nextIndex] >= 13)
			{
				nextIndex++;

				if (nextIndex > 6)
				{
					foundIndexToSlot = false;
				}
			}

			if (foundIndexToSlot == false)
			{
				nextIndex = index;
				foundIndexToSlot = true;

				while (nextIndex > 0 && _totals[nextIndex] >= 13)
				{
					nextIndex--;

					if (nextIndex < 0)
					{
						foundIndexToSlot = false;
					}
				}
			}

			if (foundIndexToSlot)
			{
				tree[nextIndex].push(L[i]);
				_totals[nextIndex]++;
			}

			i = ++i;
		}
	}

	foreach( t in _localMap.Traits )
	{
		if (t.Attributes)
		{
			local c = t.Attributes;
			attributes.Hitpoints[0] += c.Hitpoints[0];
			attributes.Hitpoints[1] += c.Hitpoints[1];
			attributes.Bravery[0] += c.Bravery[0];
			attributes.Bravery[1] += c.Bravery[1];
			attributes.Stamina[0] += c.Stamina[0];
			attributes.Stamina[1] += c.Stamina[1];
			attributes.MeleeSkill[0] += c.MeleeSkill[0];
			attributes.MeleeSkill[1] += c.MeleeSkill[1];
			attributes.MeleeDefense[0] += c.MeleeDefense[0];
			attributes.MeleeDefense[1] += c.MeleeDefense[1];
			attributes.RangedSkill[0] += c.RangedSkill[0];
			attributes.RangedSkill[1] += c.RangedSkill[1];
			attributes.RangedDefense[0] += c.RangedDefense[0];
			attributes.RangedDefense[1] += c.RangedDefense[1];
			attributes.Initiative[0] += c.Initiative[0];
			attributes.Initiative[1] += c.Initiative[1];
		}
	}

	return {
		Tree = tree,
		Attributes = attributes
	};
};
gt.Const.Perks.isInTree <- function ( _tree, _perk )
{
	foreach( row in _tree )
	{
		foreach( p in row )
		{
			if (p == _perk)
			{
				return true;
			}
		}
	}

	return false;
};
gt.Const.Perks.MergeDynamicPerkTree <- function ( _tree, _map )
{
	foreach( v in _map )
	{
		foreach( mT in v )
		{
			foreach( i, row in mT.Tree )
			{
				foreach( p in row )
				{
					if (this.Const.Perks.isInTree(_tree, p))
					{
						continue;
					}

					_tree[i].push(p);
				}
			}
		}
	}

	return _tree;
};
gt.Const.Perks.PerksTreeTemplate <- gt.Const.Perks.BuildCustomPerkTree(VanillaTree);

