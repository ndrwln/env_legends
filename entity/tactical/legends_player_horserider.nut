this.legends_player_horserider <- this.inherit("scripts/entity/tactical/player", {
	m = {
		Rider = null,
		Horse = null,
		playerArmor = null,
		horseArmor = null,
		horseHelmet = null,
		LastBodyPartHit = this.Const.BodyPart.Body,
		Tile = null,
		RiderSkills = null,
		HorseSkills = null
	},
	function setRider( _a )
	{
		this.m.Rider = this.WeakTableRef(_a);
	}

	function getRider()
	{
		return this.m.Rider;
	}

	function setHorse( _a )
	{
		this.m.PlaceInFormation = _a.getPlaceInFormation();
		this.m.Horse = this.WeakTableRef(_a);
	}

	function getHorse()
	{
		return this.m.Horse;
	}

	function getItems()
	{
		return this.m.Items;
	}

	function onCombatStart()
	{
		this.getBackground().onSetAppearance();
	}

	function setScenarioValues()
	{
		this.getFlags().add("IsHorseRider");

		if (!this.getRider().getCurrentProperties().IsContentWithBeingInReserve)
		{
			this.getRider().getFlags().add("TemporaryRider");
		}

		local b = this.m.BaseProperties;
		b.ActionPoints = 9;
		local horseHP = this.getHorse().getHitpoints();
		this.logInfo("horseHP is " + horseHP);
		local riderHP = this.getRider().getHitpoints();
		this.logInfo("riderHP is " + riderHP);
		local totalHP = this.Math.floor((horseHP + riderHP) / 2);
		b.Hitpoints = totalHP;
		this.logInfo("totalHP is " + b.Hitpoints);
		local horseBravery = this.getHorse().getBaseProperties().Bravery;
		this.logInfo("horseBravery is " + horseBravery);
		local riderBravery = this.getRider().getBaseProperties().Bravery;
		this.logInfo("riderBravery is " + riderBravery);
		local totalBravery = (horseBravery + riderBravery) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_liberty"))
		{
			totalBravery = totalBravery + riderBravery * 0.25;
		}

		this.logInfo("totalBravery is " + totalBravery);
		b.Bravery = totalBravery;
		local horseFatigue = this.getHorse().getBaseProperties().Stamina;
		this.logInfo("horseFatigue is " + horseFatigue);
		local riderFatigue = this.getRider().getBaseProperties().Stamina;
		this.logInfo("riderFatiguee is " + riderFatigue);
		local totalFatigue = (horseFatigue + riderFatigue) / 2;
		this.logInfo("totalFatiguee is " + totalFatigue);
		b.Stamina = totalFatigue;
		local horseMeleeSkill = this.getHorse().getBaseProperties().MeleeSkill;
		local riderMeleeSkill = this.getRider().getBaseProperties().MeleeSkill;
		local totalMeleeSkill = (horseMeleeSkill + riderMeleeSkill) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_desensitization"))
		{
			totalMeleeSkill = totalMeleeSkill + riderMeleeSkill * 0.25;
		}

		b.MeleeSkill = totalMeleeSkill;
		local horseRangedSkill = this.getHorse().getBaseProperties().RangedSkill;
		local riderRangedSkill = this.getRider().getBaseProperties().RangedSkill;
		local totalRangedSkill = (horseRangedSkill + riderRangedSkill) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_parthian_shot"))
		{
			totalRangedSkill = totalRangedSkill + riderRangedSkill * 0.25;
		}

		b.RangedSkill = totalRangedSkill;
		local horseMeleeDefense = this.getHorse().getBaseProperties().MeleeDefense;
		local riderMeleeDefense = this.getRider().getBaseProperties().MeleeDefense;
		local totalMeleeDefense = (horseMeleeDefense + riderMeleeDefense) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_bitting"))
		{
			totalMeleeDefense = totalMeleeDefense + riderMeleeDefense * 0.25;
		}

		b.MeleeDefense = totalMeleeDefense;
		local horseRangedDefense = this.getHorse().getBaseProperties().RangedDefense;
		local riderRangedDefense = this.getRider().getBaseProperties().RangedDefense;
		local totalRangedDefense = (horseRangedDefense + riderRangedDefense) / 2;
		b.RangedDefense = totalRangedDefense;
		local horseInitiative = this.getHorse().getBaseProperties().Initiative;
		local riderInitiative = this.getRider().getBaseProperties().Initiative;
		local totalInitiative = (horseInitiative + riderInitiative) / 2;
		b.Initiative = totalInitiative;
		local horseName = this.getHorse().getName();
		local riderName = this.getRider().getName();
		local newName = riderName + " and " + horseName;
		this.setName(newName);
		local background = this.new("scripts/skills/backgrounds/legend_horserider");
		background.addBackgroundType(this.Const.BackgroundType.Scenario);
		this.m.Skills.add(background);
		this.m.ActionPointCosts = this.Const.HorseMovementAPCost;
		this.m.FatigueCosts = clone this.Const.HorseMovementFatigueCost;
		this.getSkills().add(this.new("scripts/skills/actives/legend_horse_kick"));
		this.getSkills().add(this.new("scripts/skills/actives/legend_horse_charge"));

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_movement") && !this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_movement"));
		}

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_passage"));
		}

		this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_pirouette"));
		this.getSkills().add(this.new("scripts/skills/perks/perk_horse_charge"));

		if (this.getRider().getSkills().hasSkill("perk.legend_horse_movement") && !this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_movement"));
		}

		this.getRider().getItems().transferTo(this.m.Items);
		this.m.playerArmor = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body);

		if (this.m.playerArmor != null)
		{
			this.m.Items.unequip(this.m.playerArmor);
		}

		this.m.horseArmor = this.getHorse().getItems().getItemAtSlot(this.Const.ItemSlot.Body);

		if (this.m.horseArmor != null)
		{
			this.m.Items.equip(this.m.horseArmor);
		}

		background.buildDescription();
		local c = this.m.CurrentProperties;
		this.m.ActionPoints = c.ActionPoints;
		this.m.Hitpoints = c.Hitpoints;
		this.m.Talents.resize(this.Const.Attributes.COUNT, 0);
		this.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
	}

	function getPlaceInFormation()
	{
		return this.m.PlaceInFormation;
	}

	function kill( _killer = null, _skill = null, _fatalityType = this.Const.FatalityType.None, _silent = false )
	{
		this.player.kill(_killer, _skill, _fatalityType, _silent);
		local num = this.Tactical.Entities.getAlliesNum();

		if (num == 1 || num == 0)
		{
			this.World.getPlayerRoster().remove(this.getRider());
			this.World.getPlayerRoster().remove(this.getHorse());
			return;
		}

		local pBody = this.getRider().getSprite("body");

		if (this.m.LastBodyPartHit == this.Const.BodyPart.Body)
		{
			if (pBody != null && typeof pBody != "instance")
			{
				pBody.set("bust_naked_body_03");
			}

			this.getHorse().kill(_killer, _skill, _fatalityType, _silent);
		}
		else
		{
			this.getRider().kill(_killer, _skill, _fatalityType, _silent);
		}
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		this.m.Tile = this.getTile();
		this.player.onDeath(_killer, _skill, _tile, _fatalityType);
		local num = this.Tactical.Entities.getAlliesNum();

		if (num == 1 || num == 0)
		{
			this.World.getPlayerRoster().remove(this.getRider());
			this.World.getPlayerRoster().remove(this.getHorse());
			return;
		}

		if (this.m.LastBodyPartHit == this.Const.BodyPart.Body)
		{
			this.getHorse().onDeath(_killer, _skill, null, this.Const.FatalityType.Suicide);
		}
		else
		{
			this.getRider().onDeath(_killer, _skill, null, this.Const.FatalityType.Suicide);
		}
	}

	function onAfterDeath( _tile )
	{
		if (this.Tactical.Entities.getAlliesNum() == 0)
		{
			return;
		}

		if (this.m.LastBodyPartHit == this.Const.BodyPart.Head)
		{
			this.spawnHorse();
			return;
		}

		this.spawnRider();
		return;
	}

	function spawnHorse()
	{
		this.Tactical.addEntityToMap(this.getHorse(), this.m.Tile.Coords.X, this.m.Tile.Coords.Y);
	}

	function spawnRider()
	{
		this.Tactical.addEntityToMap(this.getRider(), this.m.Tile.Coords.X, this.m.Tile.Coords.Y);
		local entity = this.m.Tile.getEntity();
		this.m.Items.transferTo(this.getRider().getItems());
	}

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		this.m.LastBodyPartHit = _hitInfo.BodyPart;
		this.player.onDamageReceived(_attacker, _skill, _hitInfo);
	}

	function onCombatFinished()
	{
		if (this.m.horseArmor != null)
		{
			this.m.Items.unequip(this.m.horseArmor);
			this.getHorse().getItems().equip(this.m.horseArmor);
		}

		if (this.m.playerArmor != null)
		{
			this.m.Items.equip(this.m.playerArmor);
		}

		this.m.Items.transferTo(this.getRider().getItems());
		local horseHP = this.getHorse().getHitpoints();
		local riderHP = this.getRider().getHitpoints();
		local hpMissing = this.getHitpointsPct();
		this.getRider().setHitpoints(riderHP * hpMissing > 0 ? riderHP * hpMissing : riderHP);
		this.getHorse().setHitpoints(horseHP * hpMissing > 0 ? horseHP * hpMissing : horseHP);
		this.World.getPlayerRoster().remove(this);
	}

});

