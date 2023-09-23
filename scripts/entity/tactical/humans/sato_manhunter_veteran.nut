this.sato_manhunter_veteran <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.SatoManhunterVeteranRanged;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.SatoManhunterVeteran.XP;
		this.human.create();
		this.m.Bodies = this.Const.Bodies.SouthernMale;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.SouthernUntidy;
		this.m.BeardChance = 90;
		this.m.Ethnicity = 1;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/sato_manhunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.SatoManhunterVeteran);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_nomads");

		if (this.Math.rand(1, 100) <= 15)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_darkeyes_01");
		}
		else
		{
			local dirt = this.getSprite("dirt");
			dirt.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			this.getSprite("eye_rings").Visible = true;
		}

		b.IsSpecializedInMaces = true;
		b.IsSpecializedInCleavers = true;
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInDaggers = true;
		b.IsSpecializedInThrowing = true;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
	}

	function onOtherActorDeath( _killer, _victim, _skill )
	{
		if (_victim.getType() == this.Const.EntityType.Slave && _victim.isAlliedWith(this))
		{
			return;
		}

		this.actor.onOtherActorDeath(_killer, _victim, _skill);
	}

	function onOtherActorFleeing( _actor )
	{
		if (_actor.getType() == this.Const.EntityType.Slave && _actor.isAlliedWith(this))
		{
			return;
		}

		this.actor.onOtherActorFleeing(_actor);
	}

	function assignRandomEquipment()
	{
		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			local weapons = [
				"weapons/shamshir",
				"weapons/oriental/heavy_southern_mace",
				"weapons/oriental/qatal_dagger",
				"weapons/oriental/polemace"
			];

			if (this.Const.DLC.Wildmen)
			{
				weapons.extend([
					"weapons/shamshir",
					"weapons/shamshir",
					"weapons/oriental/heavy_southern_mace",
					"weapons/oriental/heavy_southern_mace",
					"weapons/oriental/qatal_dagger",
					"weapons/oriental/qatal_dagger",
					"weapons/oriental/polemace",
					"weapons/oriental/polemace",
					"weapons/battle_whip"
				]);
			}

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Offhand) && this.Math.rand(1, 100) <= 90)
		{
			this.m.Items.equip(this.new("scripts/items/tools/throwing_net"));
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.battle_whip")
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/oriental/light_southern_mace"));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Body))
		{
			local armors = [
				[
					1,
					"oriental/southern_long_mail_with_padding"
				],
				[
					1,
					"mail_hauberk"
				],
				[
					1,
					"reinforced_mail_hauberk"
				],
				[
					1,
					"lamellar_harness"
				]
			];

			if (this.Const.DLC.Unhold)
			{
				armors.extend([
					[
						1,
						"leather_scale_armor"
					],
					[
						1,
						"footman_armor"
					]
				]);
			}

			if (this.World.getTime().Days <= 50)
			{
				armors.extend([
					[
						1,
						"oriental/southern_long_mail_with_padding"
					]
				]);
			}
			else
			{
				armors.extend([
					[
						1,
						"heavy_lamellar_armor"
					],
					[
						1,
						"oriental/padded_mail_and_lamellar_hauberk"
					]
				]);
			}

			this.m.Items.equip(this.Const.World.Common.pickArmor(armors));
		}

		if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Head))
		{
			local helmets = [
				[
					2,
					"oriental/spiked_skull_cap_with_mail"
				],
				[
					2,
					"oriental/southern_helmet_with_coif"
				]
			];

			if (this.World.getTime().Days > 50)
			{
				helmets.extend([
					[
						1,
						"oriental/heavy_lamellar_helmet"
					],
					[
						1,
						"oriental/turban_helmet"
					]
				]);
			}

			if (this.Const.DLC.Wildmen)
			{
				helmets.extend([
					[
						1,
						"conic_helmet_with_closed_mail"
					],
					[
						1,
						"conic_helmet_with_faceguard"
					],
					[
						1,
						"barbute_helmet"
					]
				]);
				helmets.push([
					1,
					"theamson_barbute_helmet"
				]);
			}

			this.m.Items.equip(this.Const.World.Common.pickHelmet(helmets));
		}
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = [
			"weapons/named/named_shamshir",
			"weapons/named/named_mace",
			"weapons/named/named_polemace"
		];
		local armors = clone this.Const.Items.NamedSouthernArmors;
		armors.push("armor/named/golden_scale_armor");

		if (this.Const.DLC.Wildmen)
		{
			armors.push("armor/named/named_golden_lamellar_armor");
		}

		local helmets = clone this.Const.Items.NamedSouthernHelmets;
		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.Const.World.Common.pickArmor(this.Const.World.Common.convNameToList(armors)));
		}
		else
		{
			this.m.Items.equip(this.Const.World.Common.pickHelmet(this.Const.World.Common.convNameToList(helmets)));
		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		return true;
	}

});

