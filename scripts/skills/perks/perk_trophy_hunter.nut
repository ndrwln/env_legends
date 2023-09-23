this.perk_trophy_hunter <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.trophy_hunter";
		this.m.Name = this.Const.Strings.PerkName.TrophyHunter;
		this.m.Description = this.Const.Strings.PerkDescription.TrophyHunter;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		local actor = this.getContainer().getActor();

		if (!_targetEntity.isAlliedWith(actor))
		{
			actor.setHitpoints(actor.getHitpoints() + 1);
			actor.getBaseProperties().Hitpoints += 1;
		}
	}

});

