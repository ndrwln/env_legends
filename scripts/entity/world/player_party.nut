this.player_party <- this.inherit("scripts/entity/world/party", {
	m = {
		LastFireTime = 0,
		BarterMultiplier = 0.0,
		WageMultiplier = 0.0,
		FoodMultiplier = 0,
		AmmoMultiplier = 0,
		ArmorPartsMultiplier = 0,
		MedsMultiplier = 0,
		StashMultiplier = 0
	},
	function updateStrength()
	{
		this.m.Strength = 0.0;
		local roster = this.World.getPlayerRoster().getAll();

		if (roster.len() > this.World.Assets.getBrothersScaleMax())
		{
			roster.sort(this.onLevelCompare);
		}

		if (roster.len() < this.World.Assets.getBrothersScaleMin())
		{
			this.m.Strength += 10.0 * (this.World.Assets.getBrothersScaleMin() - roster.len());
		}

		if (this.World.Assets.getOrigin() == null)
		{
			this.m.Strength * 0.8;
			return;
		}

		local broScale = 1.0;

		if (this.World.Assets.getOrigin().getID() == "scenario.militia")
		{
			broScale = 0.66;
		}

		if (this.World.Assets.getOrigin().getID() == "scenario.lone_wolf")
		{
			broScale = 1.66;
		}

		local zombieSummonLevel = 0;
		local skeletonSummonLevel = 0;
		local count = 0;

		foreach( i, bro in roster )
		{
			if (i >= 25)
			{
				break;
			}

			if (bro.getSkills().hasSkill("perk.legend_pacifist"))
			{
				continue;
			}

			if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_high"))
			{
				zombieSummonLevel = 7;
			}
			else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_med"))
			{
				zombieSummonLevel = 5;
			}
			else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_low"))
			{
				zombieSummonLevel = 2;
			}

			if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_high"))
			{
				skeletonSummonLevel = 7;
			}
			else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_med"))
			{
				skeletonSummonLevel = 5;
			}
			else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_low"))
			{
				skeletonSummonLevel = 2;
			}

			local brolevel = bro.getLevel();

			if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
			{
				this.m.Strength += (3 + (brolevel / 4 + (brolevel - 1)) * 1.5) * broScale;
			}
			else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Normal)
			{
				this.m.Strength += (10 + (brolevel / 2 + (brolevel - 1)) * 2) * broScale;
			}
			else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hard)
			{
				this.m.Strength += (6 + count / 2 + (brolevel / 2 + this.pow(brolevel, 1.2))) * broScale;
			}
			else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Strength += (count + (brolevel + this.pow(brolevel, 1.2))) * broScale;
			}

			local mainhand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			local offhand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			local body = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			local head = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
			local mainhandvalue = 0;
			local offhandvalue = 0;
			local bodyvalue = 0;
			local headvalue = 0;

			if (mainhand != null)
			{
				mainhandvalue = mainhandvalue + mainhand.getSellPrice() / 1000;
			}

			if (offhand != null)
			{
				offhandvalue = offhandvalue + offhand.getSellPrice() / 1000;
			}

			if (body != null)
			{
				bodyvalue = bodyvalue + body.getSellPrice() / 1000;
			}

			if (head != null)
			{
				headvalue = headvalue + head.getSellPrice() / 1000;
			}

			local gearvalue = mainhandvalue + offhandvalue + bodyvalue + headvalue;
			this.m.Strength += gearvalue;
			count++;
		}

		if (zombieSummonLevel == 0 && skeletonSummonLevel == 0)
		{
			return;
		}

		local stash = this.World.Assets.getStash().getItems();
		local zCount = 0;
		local sCount = 0;

		foreach( item in stash )
		{
			if (item == null)
			{
				continue;
			}

			switch(item.getID())
			{
			case "spawns.zombie":
				if (zombieSummonLevel == 0)
				{
					continue;
				}

				zCount = ++zCount;
				break;

			case "spawns.skeleton":
				if (skeletonSummonLevel == 0)
				{
					continue;
				}

				sCount = ++sCount;
				break;
			}
		}

		if (zCount > 1)
		{
			zCount = this.Math.floor(zCount / 2.0);

			for( local i = 0; i < zCount; i = i )
			{
				this.m.Strength += 3 + (zombieSummonLevel / 2 + (zombieSummonLevel - 1)) * 2.0;
				i = ++i;
			}
		}

		if (sCount > 1)
		{
			sCount = this.Math.floor(sCount / 2.0);

			for( local i = 0; i < sCount; i = i )
			{
				this.m.Strength += 3 + (skeletonSummonLevel / 2 + (skeletonSummonLevel - 1)) * 2.0;
				i = ++i;
			}
		}
	}

	function onLevelCompare( _bro1, _bro2 )
	{
		if (_bro1.getLevel() > _bro2.getLevel())
		{
			return -1;
		}
		else if (_bro1.getLevel() < _bro2.getLevel())
		{
			return 1;
		}

		return 0;
	}

	function getStrength()
	{
		this.updateStrength();
		return this.m.Strength;
	}

	function setCamping( _c )
	{
		if (_c)
		{
			this.getSprite("body").setBrush("world_player_camp_01");
			this.getSprite("banner").Visible = false;
			this.getSprite("lighting").Visible = true;
		}
		else
		{
			this.World.Assets.updateLook();
			this.getSprite("banner").Visible = true;
			this.getSprite("lighting").Visible = false;
		}
	}

	function spawnFire()
	{
		local smoke = this.Const.World.CampSmokeParticles;

		for( local i = 0; i < smoke.len(); i = i )
		{
			this.World.spawnParticleEffect(smoke[i].Brushes, smoke[i].Delay, smoke[i].Quantity, smoke[i].LifeTime, smoke[i].SpawnRate, smoke[i].Stages, this.createVec(this.getPos().X, this.getPos().Y - 30), -200 + this.Const.World.ZLevel.Particles, true);
			i = ++i;
		}

		local fire = this.Const.World.CampFireParticles;

		for( local i = 0; i < fire.len(); i = i )
		{
			this.World.spawnParticleEffect(fire[i].Brushes, fire[i].Delay, fire[i].Quantity, fire[i].LifeTime, fire[i].SpawnRate, fire[i].Stages, this.createVec(this.getPos().X, this.getPos().Y - 30), -200 + this.Const.World.ZLevel.Particles - 3, true);
			i = ++i;
		}
	}

	function getVisionRadius()
	{
		if (this.World.Assets.isCamping())
		{
			local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Scout);
			return tent.getVisionRadius();
		}

		return this.m.VisionRadius * this.World.Assets.m.VisionRadiusMult * this.World.getGlobalVisibilityMult() * this.Const.World.TerrainTypeVisionRadiusMult[this.getTile().Type] * (this.World.Assets.isCamping() ? 0.75 : 1.0);
	}

	function getVisibilityMult()
	{
		return this.World.Assets.isCamping() ? this.m.VisibilityMult * (this.World.getTime().IsDaytime ? 2.0 : 4.0) : this.m.VisibilityMult;
	}

	function create()
	{
		this.m.IsPlayer = true;
		this.m.IsAttackable = true;
		this.m.IsLeavingFootprints = false;
		this.party.create();
		this.m.BaseMovementSpeed = 105;
	}

	function onUpdate()
	{
		this.party.onUpdate();
		this.World.setPlayerPos(this.getPos());
		this.World.setPlayerVisionRadius(this.getVisionRadius());

		if (this.World.Assets.isCamping())
		{
			local lighting = this.getSprite("lighting");

			if (lighting.IsFadingDone)
			{
				if (lighting.Alpha == 0 && this.World.getTime().TimeOfDay >= 4 && this.World.getTime().TimeOfDay <= 7)
				{
					lighting.Color = this.createColor("ffffff00");
					lighting.fadeIn(4000);
				}
				else if (lighting.Alpha != 0 && this.World.getTime().TimeOfDay >= 0 && this.World.getTime().TimeOfDay <= 3)
				{
					lighting.fadeOut(2000);
				}
			}

			if (this.Time.getRealTimeF() - this.m.LastFireTime >= 10.0)
			{
				this.spawnFire();
				this.m.LastFireTime = this.Time.getRealTimeF();
			}
		}
	}

	function onContact()
	{
	}

	function setBaseImage( _version = -1 )
	{
		local image = "figure_player_01";

		if (_version > 1 && _version < 10)
		{
			image = "figure_player_0" + _version;
		}
		else if (_version > 100)
		{
			switch(_version)
			{
			case 101:
				image = "figure_player_noble";
				break;

			case 102:
				image = "figure_player_crusader";
				break;

			case 103:
				image = "figure_player_ranger";
				break;

			case 104:
				image = "figure_player_warlock";
				break;

			case 105:
				image = "figure_player_seer";
				break;

			case 106:
				image = "figure_player_berserker";
				break;

			case 107:
				image = "figure_player_trader";
				break;

			case 108:
				image = "figure_player_vala";
				break;

			case 109:
				image = "figure_player_party";
				break;

			case 110:
				image = "figure_player_assassin";
				break;

			case 111:
				image = "figure_player_beggar";
				break;

			case 112:
				image = "figure_player_legion";
				break;

			case 113:
				image = "figure_player_inquisition";
				break;

			case 114:
				image = "figure_player_troupe";
				break;

			case 115:
				image = "figure_player_druid";
				break;

			case 116:
				image = "figure_player_slave";
				break;

			case 117:
				image = "figure_player_nomad";
				break;
			}
		}
		else if (_version > 9)
		{
			image = "figure_player_" + _version;
		}
		else
		{
			image = "figure_player_01";
		}

		this.getSprite("body").setBrush(image);
	}

	function getBarterMult()
	{
		return this.m.BarterMultiplier;
	}

	function getWageModifier()
	{
		return this.m.WageMultiplier;
	}

	function getFoodModifier()
	{
		return this.m.FoodMultiplier;
	}

	function getAmmoModifier()
	{
		return this.m.AmmoMultiplier;
	}

	function getArmorPartsModifier()
	{
		return this.m.ArmorPartsMultiplier;
	}

	function getMedsModifier()
	{
		return this.m.MedsMultiplier;
	}

	function getStashModifier()
	{
		return this.m.StashMultiplier;
	}

	function calculateModifiers()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 1)
		{
			this.calculateBarterMult();
			this.calculateWageModifier();
			this.calculateFoodModifier();
			this.calculateAmmoModifier();
			this.calculateArmorPartsModifier();
			this.calculateMedsModifier();
			this.calculateStashModifier();
		}
	}

	function calculateFoodModifier()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 0)
		{
			return;
		}

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			if (!bro.getSkills().hasSkill("perk.legend_quartermaster"))
			{
				continue;
			}

			this.m.FoodMultiplier = 1;
			break;
		}
	}

	function calculateWageModifier()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 0)
		{
			return;
		}

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			if (bro.getSkills().hasSkill("perk.legend_barter_paymaster"))
			{
				this.m.WageMultiplier = bro.getBarterModifier();
				return;
			}
		}
	}

	function calculateBarterMult()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 0)
		{
			return;
		}

		local barterMult = 0.0;
		local greed = 1;

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			barterMult = barterMult + bro.getBarterModifier();

			if (bro.getSkills().hasSkill("perk.legend_barter_greed"))
			{
				greed = greed + 1;
			}
		}

		if (this.World.Assets.getOrigin().getID() == "scenario.trader")
		{
			barterMult = barterMult * 1.1;
		}

		this.m.BarterMultiplier = barterMult / greed;
	}

	function calculateAmmoModifier()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 0)
		{
			return;
		}

		local s = 0;

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			s = s + bro.getAmmoModifier();
		}

		this.m.AmmoMultiplier = s;
	}

	function calculateArmorPartsModifier()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 0)
		{
			return;
		}

		local s = 0;

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			s = s + bro.getArmorPartsModifier();
		}

		this.m.ArmorPartsMultiplier = s;
	}

	function calculateMedsModifier()
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 0)
		{
			return;
		}

		local s = 0;

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			s = s + bro.getMedsModifier();
		}

		this.m.MedsMultiplier = s;
	}

	function calculateStashModifier( resize = true )
	{
		if (this.World.State.m.AppropriateTimeToRecalc == 1)
		{
			local s = this.Const.LegendMod.MaxResources[this.World.Assets.getEconomicDifficulty()].Stash;
			s = s + this.World.Assets.getOrigin().getStashModifier();
			s = s + this.World.Retinue.getInventoryUpgrades() * 27;

			foreach( bro in this.World.getPlayerRoster().getAll() )
			{
				s = s + bro.getStashModifier();
			}

			if (resize && s != this.Stash.getCapacity())
			{
				this.Stash.resize(s);
			}

			return s;
		}
	}

	function onInit()
	{
		this.setFaction(this.Const.FactionType.Player);
		this.party.onInit();
		this.m.VisionRadius = this.Const.World.Settings.Vision;
		this.getSprite("base").setBrush("world_base_01");
		this.getSprite("banner").setBrush(this.World.Assets.getBanner());
		this.setBaseImage(1);
		local lighting = this.addSprite("lighting");
		this.setSpriteColorization("lighting", false);
		lighting.setBrush("world_player_camp_01_fire");
		lighting.Visible = false;
		lighting.Alpha = 0;
		lighting.IgnoreAmbientColor = true;
		local zoom_banner = this.addSprite("zoom_banner");
		zoom_banner.setBrush(this.World.Assets.getBanner());
		zoom_banner.Alpha = 0;
		this.setSpriteScaling("zoom_banner", false);
	}

	function onFinish()
	{
		this.party.onFinish();
	}

	function onSerialize( _out )
	{
		this.party.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.party.onDeserialize(_in);
		this.getSprite("lighting").Color = this.createColor("ffffff00");
		this.m.LastUpdateTime = this.Time.getVirtualTimeF();
	}

});

