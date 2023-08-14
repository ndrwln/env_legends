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

		if (_skill.isAttack() && _targetEntity.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury) || _targetEntity.getSkills().hasSkill("effects.debilitated"))
		{
			_properties.DamageTotalMult *= 1.2;
		}

		if (_targetEntity.getSkills().hasSkill("effects.stunned") || _targetEntity.getSkills().hasSkill("effects.net") || _targetEntity.getSkills().hasSkill("effects.sleeping"))
		{
			_properties.DamageTotalMult *= 1.1;
		}
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (_skill.isAttack() && _targetEntity != null && _targetEntity.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
		{
			this.spawnIcon("perk_16", this.getContainer().getActor().getTile());
		}
	}

});

