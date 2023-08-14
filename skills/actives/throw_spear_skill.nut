this.throw_spear_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.throw_spear";
		this.m.Name = "Throw Spear";
		this.m.Description = "Hurl a throwing spear at a target in order to render their shield unusable. Targets with a shield will always be hit. Hitting a target without a shield can inflict devastating damage instead, but the attack may miss. Can not be used while engaged in melee.";
		this.m.KilledString = "Impaled";
		this.m.Icon = "skills/active_138.png";
		this.m.IconDisabled = "skills/active_138_sw.png";
		this.m.Overlay = "active_138";
		this.m.SoundOnUse = [
			"sounds/combat/dlc2/throwing_spear_throw_01.wav",
			"sounds/combat/dlc2/throwing_spear_throw_02.wav",
			"sounds/combat/dlc2/throwing_spear_throw_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc2/throwing_spear_hit_01.wav",
			"sounds/combat/dlc2/throwing_spear_hit_02.wav",
			"sounds/combat/dlc2/throwing_spear_hit_03.wav",
			"sounds/combat/dlc2/throwing_spear_hit_04.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/dlc2/throwing_spear_miss_01.wav",
			"sounds/combat/dlc2/throwing_spear_miss_02.wav",
			"sounds/combat/dlc2/throwing_spear_miss_03.wav",
			"sounds/combat/dlc2/throwing_spear_miss_04.wav"
		];
		this.m.SoundOnHitShield = [
			"sounds/combat/dlc2/throwing_spear_hit_shield_01.wav",
			"sounds/combat/dlc2/throwing_spear_hit_shield_02.wav",
			"sounds/combat/dlc2/throwing_spear_hit_shield_03.wav",
			"sounds/combat/dlc2/throwing_spear_hit_shield_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsOffensiveToolSkill = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsWeaponSkill = true;
		this.m.IsDoingForwardMove = false;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.45;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 2;
		this.m.MaxRange = 4;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Javelin;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		local ammo = this.getAmmo();

		if (ammo > 0)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/ammo.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]" + ammo + "[/color] throwing spear left"
			});
		}
		else
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]No throwing spears left[/color]"
			});
		}

		local damage = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getShieldDamage();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/shield_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage + "[/color] damage to shields"
		});
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles on even ground, more if throwing downhill"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] per tile of distance"
			}
		]);

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
		return !this.Tactical.isActive() || this.skill.isUsable() && this.getAmmo() > 0 && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function getAmmo()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item == null)
		{
			return 0;
		}

		return item.getAmmo();
	}

	function consumeAmmo()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item != null)
		{
			item.consumeAmmo();
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		this.consumeAmmo();
		local shield = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
		{
			local flip = !this.m.IsProjectileRotated && targetEntity.getPos().X > _user.getPos().X;
			local time = this.Tactical.spawnProjectileEffect(this.Const.ProjectileSprite[this.m.ProjectileType], _user.getTile(), _targetTile, 1.0, this.m.ProjectileTimeScale, this.m.IsProjectileRotated, flip);
			this.Time.scheduleEvent(this.TimeUnit.Virtual, time, this.onApplyShieldDamage.bindenv(this), {
				User = _user,
				Skill = this,
				TargetTile = _targetTile,
				Shield = shield,
				Damage = _user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getShieldDamage()
			});
		}
		else
		{
			local ret = this.attackEntity(_user, targetEntity);
		}

		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += 20;
			_properties.HitChanceAdditionalWithEachTile -= 10;

			if (_properties.IsSpecializedInSpearThrust)
			{
				_properties.HitChanceAdditionalWithEachTile += 10;
			}

			if (_targetEntity != null)
			{
				local shield = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

				if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
				{
					this.m.IsUsingHitchance = false;
				}
				else
				{
					this.m.IsUsingHitchance = true;
				}
			}
			else
			{
				this.m.IsUsingHitchance = true;
			}
		}
	}

	function onApplyShieldDamage( _tag )
	{
		local conditionBefore = _tag.Shield.getCondition();
		_tag.Shield.applyShieldDamage(_tag.Damage);

		if (_tag.Shield.getCondition() == 0)
		{
			if (!_tag.User.isHiddenToPlayer() && _tag.TargetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_tag.User) + " has destroyed " + this.Const.UI.getColorizedEntityName(_tag.TargetTile.getEntity()) + "\'s shield");
			}
		}
		else
		{
			if (!_tag.User.isHiddenToPlayer() && _tag.TargetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_tag.TargetTile.getEntity()) + "\'s shield is hit for [b]" + (conditionBefore - _tag.Shield.getCondition()) + "[/b] damage");
			}

			if (_tag.Skill.m.SoundOnHitShield.len() != 0)
			{
				this.Sound.play(_tag.Skill.m.SoundOnHitShield[this.Math.rand(0, _tag.Skill.m.SoundOnHitShield.len() - 1)], this.Const.Sound.Volume.Skill, _tag.TargetTile.getEntity().getPos());
			}
		}

		if (!this.Tactical.getNavigator().isTravelling(_tag.TargetTile.getEntity()))
		{
			this.Tactical.getShaker().shake(_tag.TargetTile.getEntity(), _tag.User.getTile(), 2, this.Const.Combat.ShakeEffectSplitShieldColor, this.Const.Combat.ShakeEffectSplitShieldHighlight, this.Const.Combat.ShakeEffectSplitShieldFactor, 1.0, [
				"shield_icon"
			], 1.0);
		}
	}

});

