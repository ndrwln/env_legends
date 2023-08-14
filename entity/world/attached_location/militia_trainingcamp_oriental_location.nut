this.militia_trainingcamp_oriental_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {
		LastFireTime = 0
	},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Militia Barracks";
		this.m.ID = "attached_location.militia_trainingcamp";
		this.m.Description = "A large compound of militia barracks. This camp will turn ordinary peasants into somewhat able soldiers that can defend their home and their loved ones.";
		this.m.Sprite = "world_southern_militia";
		this.m.SpriteDestroyed = "world_southern_militia_ruins";
		this.m.IsMilitary = true;
		this.m.IsScalingDefenders = false;
	}

	function getSounds( _all = true )
	{
		local r = [];

		if (this.World.getTime().IsDaytime)
		{
			r = [
				{
					File = "ambience/settlement/settlement_dog_00.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/settlement_dog_01.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/settlement_dog_02.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/fortification_yelling_00.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/fortification_yelling_01.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/fortification_yelling_02.wav",
					Volume = 1.0,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/fortification_yelling_03.wav",
					Volume = 1.0,
					Pitch = 1.0
				}
			];
			return r;
		}

		return r;
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
		this.getSprite("lighting").setBrush("world_militia_trainingcamp_01_light");
		this.getSprite("lighting").Scale = 0.9;
		this.registerThinker();
	}

	function onFinish()
	{
		this.attached_location.onFinish();
		this.unregisterThinker();
	}

	function onUpdate()
	{
		if (!this.m.IsActive)
		{
			return;
		}

		this.updateLighting();

		if (this.World.getTime().TimeOfDay >= 4 && this.World.getTime().TimeOfDay <= 7 && this.Time.getRealTimeF() - this.m.LastFireTime >= 10.0)
		{
			this.spawnFire();
			this.m.LastFireTime = this.Time.getRealTimeF();
		}
	}

	function spawnFire()
	{
		local smoke = this.Const.World.CampSmokeParticles;

		for( local i = 0; i < smoke.len(); i = i )
		{
			this.World.spawnParticleEffect(smoke[i].Brushes, smoke[i].Delay, smoke[i].Quantity, smoke[i].LifeTime, smoke[i].SpawnRate, smoke[i].Stages, this.createVec(this.getPos().X + 5, this.getPos().Y - 25), -200 + this.Const.World.ZLevel.Particles, true);
			i = ++i;
		}

		local fire = this.Const.World.CampFireParticles;

		for( local i = 0; i < fire.len(); i = i )
		{
			this.World.spawnParticleEffect(fire[i].Brushes, fire[i].Delay, fire[i].Quantity, fire[i].LifeTime, fire[i].SpawnRate, fire[i].Stages, this.createVec(this.getPos().X + 5, this.getPos().Y - 25), -200 + this.Const.World.ZLevel.Particles - 3, true);
			i = ++i;
		}
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/ammo_small_item");
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";

		if (!this.isActive())
		{
			return;
		}

		_list.push("nomad_background");
		_list.push("legend_dervish_background");
		_list.push("legend_dervish_background");

		if (this.Math.rand(0, 4) == 1)
		{
			_list.push("legend_conscript_background");
		}

		if (this.Math.rand(0, 4) == 1)
		{
			_list.push("legend_conscript_ranged_background");
		}
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 30,
				P = 1.0,
				S = "armor/oriental/padded_vest"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "armor/oriental/linothorax"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/oriental/southern_head_wrap"
			});
			_list.push({
				R = 65,
				P = 1.0,
				S = "helmets/oriental/spiked_skull_cap_with_mail"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "shields/oriental/southern_light_shield"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "weapons/oriental/saif"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/scimitar"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/oriental/light_southern_mace"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "supplies/ammo_small_item"
			});
			_list.push({
				R = 90,
				P = 1.0,
				S = "tents/tent_fletcher"
			});

			if (this.Const.DLC.Unhold)
			{
				_list.extend([
					{
						R = 20,
						P = 1.0,
						S = "weapons/throwing_spear"
					}
				]);
			}
		}
		else if (_id == "building.specialized_trader")
		{
		}
		else if (_id == "building.weaponsmith")
		{
		}
		else if (_id == "building.armorsmith")
		{
			_list.push({
				R = 60,
				P = 1.0,
				S = "legend_armor/cloak/legend_armor_cloak_common"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "legend_armor/tabard/legend_southern_tabard"
			});
		}
	}

	function getNewResources()
	{
		return 0;
	}

});

