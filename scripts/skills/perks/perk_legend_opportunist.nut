this.perk_legend_opportunist <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_opportunist";
		this.m.Name = this.Const.Strings.PerkName.LegendOpportunist;
		this.m.Description = this.Const.Strings.PerkDescription.LegendOpportunist;
		this.m.Icon = "ui/perks/opportunist.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill != null)
		{
			if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(this.getContainer().getActor()))
			{
				return;
			}
		}

		if (_targetEntity.getCurrentProperties().IsImmuneToDaze)
		{
			return;
		}

		foreach( id in [
			"effects.legend_grazed_effect",
			"effects.bleeding",
			"effects.goblin_poison",
			"effects.spider_poison",
			"effects.legend_redback_spider_poison",
			"effects.legend_zombie_poison",
			"effects.legend_rat_poison",
			"injury.cut_artery",
			"injury.cut_throat",
			"injury.grazed_neck"
		] )
		{
			if (!_targetEntity.getSkills().hasSkill(id))
			{
				continue;
			}

			_targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));
			break;
		}
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().hasSkill("effects.smoke"))
		{
			_properties.RangedSkillMult *= 1.5;
			_properties.MeleeSkillMult *= 1.1;
		}
	}

});

