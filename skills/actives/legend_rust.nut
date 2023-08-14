this.legend_rust <- this.inherit("scripts/skills/legend_magic_skill", {
	m = {},
	function create()
	{
		this.legend_magic_skill.create();
		this.m.AdditionalAccuracy = 10;
		this.m.DamageInitiativeMin = 15;
		this.m.DamageInitiativeMax = 45;
		this.m.ID = "actives.legend_rust";
		this.m.Name = "Rust";
		this.m.Description = "Tarnish leather and metal with rapid age, thereby undermining the solidity of the armor worn by your target. Damaged done is based off current initiative.";
		this.m.Icon = "skills/rust56.png";
		this.m.IconDisabled = "skills/rust56_bw.png";
		this.m.Overlay = "rust56";
		this.m.SoundOnUse = [
			"sounds/combat/crush_armor_01.wav",
			"sounds/combat/crush_armor_02.wav",
			"sounds/combat/crush_armor_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/crush_armor_hit_01.wav",
			"sounds/combat/crush_armor_hit_02.wav",
			"sounds/combat/crush_armor_hit_03.wav"
		];
		this.m.SoundVolume = 1.1;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsTooCloseShown = true;
		this.m.DirectDamageMult = 0.0;
		this.m.HitChanceBonus = 0;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local damage_armor_min = this.Math.floor(p.getInitiativeMinDamage());
		local damage_armor_max = this.Math.floor(p.getInitiativeMaxDamage());
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 5,
			type = "text",
			icon = "ui/icons/armor_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_max + "[/color] damage to armor"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + 10 + "[/color] damage to hitpoints that ignores armor"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] tiles"
		});
		return ret;
	}

	function getExpectedDamage( _target )
	{
		local ret = this.skill.getExpectedDamage(_target);
		ret.HitpointDamage = this.Math.max(10, ret.HitpointDamage);
		ret.TotalDamage = this.Math.max(10, ret.TotalDamage);
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		local target = _targetTile.getEntity();
		return this.attackEntity(_user, target);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.legend_magic_skill.onAnySkillUsed(_skill, _targetEntity, _properties);

		if (_skill == this)
		{
			_properties.DamageMinimum = 10;
			_properties.DamageArmorMult = 1.0;
			_properties.DamageTotalMult = 1.0;
		}
	}

});

