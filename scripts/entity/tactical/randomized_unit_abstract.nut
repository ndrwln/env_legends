this.randomized_unit_abstract <- this.inherit("scripts/entity/tactical/human", {
	m = {
		Outfits = [],
		ClassPerkList = [],
		DefensePerkList = [],
		TraitsPerkList = [],
		WeaponsAndTrees = [],
		GuaranteedPerks = [],
		LegendaryPerks = [],
		LevelRange = [
			1,
			1
		],
		EnemyLevel = 1,
		PerkPower = this.Const.PerkPurchasePower.Low
	},
	function onInit()
	{
		this.human.onInit();
	}

	function writeTablesFromParam( _table )
	{
		foreach( k, v in _table )
		{
			this.m[k] = v;
		}
	}

	function create()
	{
		this.human.create();
		local writeTable = clone this.Const.RandomizedCharacterInfo.Default;
		this.writeTablesFromParam(writeTable);

		if (this.m.Type in this.Const.RandomizedCharacterInfo)
		{
			writeTable = clone this.Const.RandomizedCharacterInfo[this.m.Type];
			this.writeTablesFromParam(writeTable);
		}
		else
		{
			this.logWarning("Entity type didnt exist: " + this.m.Type);
		}

		this.m.EnemyLevel = this.Math.rand(this.m.LevelRange[0], this.m.LevelRange[1]);
		this.m.XP = this.m.EnemyLevel * 35;

		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.PerkPower -= 1;
		}
	}

	function modifyAttributes( _attributes )
	{
		local b = this.m.BaseProperties;
		b.Hitpoints += this.Math.rand(_attributes.Hitpoints[0], _attributes.Hitpoints[1]);
		b.Bravery += this.Math.rand(_attributes.Bravery[0], _attributes.Bravery[1]);
		b.Stamina += this.Math.rand(_attributes.Stamina[0], _attributes.Stamina[1]);
		b.MeleeSkill += this.Math.rand(_attributes.MeleeSkill[0], _attributes.MeleeSkill[1]);
		b.RangedSkill += this.Math.rand(_attributes.RangedSkill[0], _attributes.RangedSkill[1]);
		b.MeleeDefense += this.Math.rand(_attributes.MeleeDefense[0], _attributes.MeleeDefense[1]);
		b.RangedDefense += this.Math.rand(_attributes.RangedDefense[0], _attributes.RangedDefense[1]);
		b.Initiative += this.Math.rand(_attributes.Initiative[0], _attributes.Initiative[1]);
	}

	function pickPerkFromTree( _purchaseLimit, _tree, _cap = 6 )
	{
		if (_cap > 6)
		{
			_cap = 6;
		}

		if (_cap > _tree.len())
		{
			_cap = _tree.len() - 1;
		}

		for( local i = 0; i <= _cap; i++ )
		{
			local row = _tree[i];

			if (row.len() != 0 && _purchaseLimit > 0)
			{
				local perkDefNum = row[0];
				local fullDef = clone this.Const.Perks.PerkDefObjects[perkDefNum];
				local toAdd = this.new(fullDef.Script);

				if (!this.m.Skills.hasSkill(toAdd.getID()))
				{
					this.m.Skills.add(toAdd);
					_purchaseLimit--;
					this.m.PerkPower--;
				}
			}
		}
	}

	function addAll( _arr )
	{
		foreach( p in _arr )
		{
			local pAdd = this.new(p);

			if (!this.m.Skills.hasSkill(pAdd.getID()))
			{
				this.m.Skills.add(pAdd);
			}
		}
	}

	function pickPerk( _purchaseLimit, _table, _cap = 6, _malus = false )
	{
		if ("Attributes" in _table)
		{
			local attr = _table.Attributes;
			this.modifyAttributes(attr);
		}
		else if (_malus)
		{
			this.modifyAttributes(this.Const.RandomizedMalus);
		}

		local tabl = _table.Tree;
		this.pickPerkFromTree(_purchaseLimit, tabl, _cap);
	}

	function assignPerks()
	{
		this.addAll(this.m.GuaranteedPerks);

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.addAll(this.m.LegendaryPerks);
		}

		local idx = this.Math.rand(0, this.m.DefensePerkList.len() - 1);
		this.pickPerk(this.m.PerkPower, this.m.DefensePerkList[idx], this.m.EnemyLevel - 1);

		while (this.m.PerkPower > 0 && this.m.TraitsPerkList.len() != 0)
		{
			local idx = this.Math.rand(0, this.m.TraitsPerkList.len() - 1);
			local selectedTree = this.m.TraitsPerkList.remove(idx);
			this.pickPerk(this.m.PerkPower, selectedTree, this.m.EnemyLevel - 1);
		}
	}

	function assignOutfit()
	{
		foreach( item in this.Const.World.Common.pickOutfit(this.m.Outfits) )
		{
			this.m.Items.equip(item);
		}
	}

	function assignWeapon()
	{
		local idx = this.Math.rand(0, this.m.WeaponsAndTrees.len() - 1);
		local selection = this.m.WeaponsAndTrees[idx];
		this.m.Items.equip(this.new(selection[0]));
		local weapon = this.getMainhandItem();
		local weaponPerkTree = this.Const.GetWeaponPerkTree(weapon);

		if (typeof weaponPerkTree == "array")
		{
			weaponPerkTree = weaponPerkTree[this.Math.rand(0, weaponPerkTree.len() - 1)];
		}

		if (weaponPerkTree != null && selection.len() >= 2 && this.Math.rand(1, 100) <= selection[1])
		{
			this.pickPerk(this.m.PerkPower, weaponPerkTree, this.m.EnemyLevel - 1);
		}

		local weaponClassTree = this.Const.GetWeaponClassTree(weapon);

		if (weaponClassTree != null && selection.len() >= 3 && this.Math.rand(1, 100) <= selection[2])
		{
			this.pickPerk(this.m.PerkPower, weaponClassTree, this.m.EnemyLevel - 1, true);
		}
	}

	function assignRandomEquipment()
	{
		this.assignWeapon();
		this.assignOutfit();
		this.assignPerks();
	}

});

