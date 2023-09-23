this.perk_coup_de_grace <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.coup_de_grace";
		this.m.Name = this.Const.Strings.PerkName.CoupDeGrace;
		this.m.Description = this.Const.Strings.PerkDescription.CoupDeGrace;
		this.m.Icon = "ui/perks/perk_16.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}

		local mult = 1.0 + this.calculateBonus(_skill, _targetEntity);
		_properties.DamageTotalMult *= mult;
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (_targetEntity != null && (this.isBonusEligible(_skill, _targetEntity) || this.isLowerBonusEligible(_skill, _targetEntity)))
		{
			this.spawnIcon("perk_16", this.getContainer().getActor().getTile());
		}
	}

	function isBonusEligible( _skill, _targetEntity )
	{
		if (_skill.isAttack() && _targetEntity.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury) || _targetEntity.getSkills().hasSkill("effects.debilitated") || _targetEntity.getSkills().hasSkill("effects.legend_tackled"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	function isLowerBonusEligible( _skill, _targetEntity )
	{
		if (!_skill.isAttack())
		{
			return false;
		}

		local effects = [
			"effects.dazed",
			"effects.distracted",
			"effects.legend_baffled",
			"effects.legend_parried",
			"effects.legend_grappled",
			"effects.net",
			"effects.rooted",
			"effects.shellshocked",
			"effects.sleeping",
			"effects.staggered",
			"effects.stunned",
			"effects.web",
			"effects.withered"
		];

		foreach( e in effects )
		{
			if (_targetEntity.getSkills().hasSkill(e))
			{
				return true;
			}
		}

		return false;
	}

	function calculateBonus( _skill, _targetEntity )
	{
		local bonus = 0;

		if (this.isBonusEligible(_skill, _targetEntity))
		{
			bonus = bonus + 0.2;
		}

		if (this.isLowerBonusEligible(_skill, _targetEntity))
		{
			bonus = bonus + 0.1;
		}

		return bonus;
	}

	function onGetHitFactors( _skill, _targetTile, _tooltip )
	{
		local bonus = this.calculateBonus(_skill, _targetTile.getEntity()) * 100;

		if (bonus > 0)
		{
			_tooltip.push({
				icon = "ui/icons/damage_dealt.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] damage from " + this.m.Name
			});
		}
	}

});

