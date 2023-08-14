this.legend_shoot_precise_stone_skill <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 0,
		AdditionalHitChance = 0
	},
	function create()
	{
		this.m.ID = "actives.legend_shoot_precise_stone";
		this.m.Name = "Precise Shot";
		this.m.Description = "Make an effort to aim for the head with a singluar, precise shot. Can\'t be used while engaged in melee.";
		this.m.KilledString = "Stoned";
		this.m.Icon = "skills/stone_aim_square.png";
		this.m.IconDisabled = "skills/stone_aim_square_sw.png";
		this.m.Overlay = "stone_aim_square";
		this.m.SoundOnUse = [
			"sounds/combat/aimed_shot_01.wav",
			"sounds/combat/aimed_shot_02.wav",
			"sounds/combat/aimed_shot_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc4/sling_hit_01.wav",
			"sounds/combat/dlc4/sling_hit_02.wav",
			"sounds/combat/dlc4/sling_hit_03.wav",
			"sounds/combat/dlc4/sling_hit_04.wav"
		];
		this.m.SoundOnHitShield = [
			"sounds/combat/dlc4/sling_shield_hit_01.wav",
			"sounds/combat/dlc4/sling_shield_hit_02.wav",
			"sounds/combat/dlc4/sling_shield_hit_03.wav",
			"sounds/combat/dlc4/sling_shield_hit_04.wav",
			"sounds/combat/dlc4/sling_shield_hit_05.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/dlc4/sling_miss_01.wav",
			"sounds/combat/dlc4/sling_miss_02.wav",
			"sounds/combat/dlc4/sling_miss_03.wav",
			"sounds/combat/dlc4/sling_miss_04.wav",
			"sounds/combat/dlc4/sling_miss_05.wav",
			"sounds/combat/dlc4/sling_miss_06.wav"
		];
		this.m.SoundOnHitDelay = -150;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 500;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsWeaponSkill = true;
		this.m.IsDoingForwardMove = false;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.3;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 9;
		this.m.MinRange = 2;
		this.m.MaxRange = 4;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Stone;
		this.m.ProjectileTimeScale = 1.2;
		this.m.IsProjectileRotated = true;
		this.m.ChanceSmash = 25;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles on even ground, more if shooting downhill"
			}
		]);
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 9,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color] chance to hit the head"
			}
		]);

		if (this.m.AdditionalAccuracy == 0)
		{
			local ret = this.getDefaultTooltip();
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + this.Const.Combat.FatigueReceivedPerHit * 2 + "[/color] extra fatigue"
			});
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.NegativeValue + "]100%[/color] chance to daze a target on a hit to the head"
			});
		}

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && (!this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()));
	}

	function onAfterUpdate( _properties )
	{
		this.m.MaxRange = this.m.Item.getRangeMax() + (_properties.IsSpecializedInSlings ? 1 : 0);
		this.m.AdditionalAccuracy = _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
		this.m.FatigueCostMult = _properties.IsSpecializedInSlings ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
		{
			this.getContainer().setBusy(true);
			local tag = {
				Skill = this,
				User = _user,
				TargetTile = _targetTile
			};
			this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.Delay, this.onPerformAttack, tag);

			if (!_user.isPlayerControlled() && _targetTile.getEntity().isPlayerControlled())
			{
				_user.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			}

			return true;
		}
		else
		{
			return this.attackEntity(_user, _targetTile.getEntity());
		}
	}

	function onPerformAttack( _tag )
	{
		_tag.Skill.getContainer().setBusy(false);
		return _tag.Skill.attackEntity(_tag.User, _tag.TargetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.FatigueDealtPerHitMult += 2.0;
			_properties.HitChance[this.Const.BodyPart.Head] += 100.0;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this && _targetEntity.isAlive() && !_targetEntity.isDying() && !_targetEntity.getCurrentProperties().IsImmuneToStun)
		{
			local targetTile = _targetEntity.getTile();
			local user = this.getContainer().getActor();

			if (_bodyPart == this.Const.BodyPart.Head)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));

				if (!user.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " struck a hit that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed");
				}
			}
		}
	}

});

