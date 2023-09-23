this.stats_collector <- this.inherit("scripts/skills/skill", {
	m = {
		Frame = 0,
		FrameKills = 0,
		FrameHits = 0,
		Round = 0,
		RoundRangedKills = 0
	},
	function create()
	{
		this.m.ID = "special.stats_collector";
		this.m.Name = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Special;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsSerialized = false;
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		local actor = this.getContainer().getActor();

		if (_targetEntity.getXPValue() > 0)
		{
			actor.getCombatStats().Kills += 1;
			actor.getLifetimeStats().Kills += 1;
			this.Const.LegendMod.SetFavoriteEnemyKill(actor, _targetEntity);
		}

		if (!_targetEntity.isPlayerControlled() && _targetEntity.getXPValue() > actor.getLifetimeStats().MostPowerfulVanquishedXP)
		{
			actor.getLifetimeStats().MostPowerfulVanquishedXP = _targetEntity.getXPValue();
			actor.getLifetimeStats().MostPowerfulVanquished = _targetEntity.getKilledName();
			actor.getLifetimeStats().MostPowerfulVanquishedType = _targetEntity.getType();
		}

		if (this.Time.getFrame() == this.m.Frame)
		{
			++this.m.FrameKills;

			if (this.m.FrameKills >= 3)
			{
				this.updateAchievement("Swingin", 1, 1);
			}
		}
		else
		{
			this.m.Frame = this.Time.getFrame();
			this.m.FrameKills = 1;
		}

		if (_skill != null && _skill.isRanged())
		{
			if (this.Time.getRound() == this.m.Round)
			{
				++this.m.RoundRangedKills;

				if (this.m.RoundRangedKills >= 2)
				{
					this.updateAchievement("Hipshooter", 1, 1);
				}
			}
			else
			{
				this.m.Round = this.Time.getRound();
				this.m.RoundRangedKills = 1;
			}
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local stats = this.getContainer().getActor().getCombatStats();
		stats.DamageDealtHitpoints += _damageInflictedHitpoints;
		stats.DamageDealtArmor += _damageInflictedArmor;

		if (this.Time.getFrame() == this.m.Frame)
		{
			++this.m.FrameHits;

			if (this.m.FrameHits >= 4 && _skill != null && _skill.getID() == "actives.fire_handgonne")
			{
				this.updateAchievement("Barrage", 1, 1);
			}
		}
		else
		{
			this.m.Frame = this.Time.getFrame();
			this.m.FrameHits = 1;
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		local stats = this.getContainer().getActor().getCombatStats();
		stats.DamageReceivedHitpoints += _damageHitpoints;
		stats.DamageReceivedArmor += _damageArmor;
	}

	function onCombatStarted()
	{
		this.m.Frame = 0;
		this.m.FrameKills = 0;
		this.m.FrameHits = 0;
		this.m.Round = 0;
		this.m.RoundRangedKills = 0;
	}

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null || this.Tactical.State.isScenarioMode())
		{
			return;
		}

		if (this.getContainer().getActor().isPlacedOnMap() && this.Tactical.State.isAutoRetreat() && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == this.getContainer().getActor().getID())
		{
			_properties.MeleeDefense += this.Const.Difficulty.RetreatDefenseBonus[this.World.Assets.getDifficulty()];
		}
	}

	function onUpdate( _properties )
	{
		if (!("State" in this.Tactical) || this.Tactical.State == null || this.Tactical.State.isScenarioMode())
		{
			return;
		}

		if (this.Time.getRound() <= 1 && this.World.Assets.getOrigin().getID() == "scenario.deserters")
		{
			_properties.InitiativeForTurnOrderAdditional += 4000;
		}
	}

});

