this.serpent_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.serpent";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onRoundEnd()
	{
		this.getContainer().update();
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local myTile = actor.getTile();

		if (myTile.hasZoneOfOccupationOtherThan(actor.getAlliedFactions()))
		{
			return;
		}

		local targets = actor.getAIAgent().getBehavior(this.Const.AI.Behavior.ID.Idle).queryTargetsInMeleeRange(2, 3);

		if (targets.len() == 0)
		{
			return;
		}

		local hasPotentialTarget = false;

		foreach( t in targets )
		{
			if (t.getTile().getZoneOfControlCountOtherThan(t.getAlliedFactions()) <= 1)
			{
				hasPotentialTarget = true;
				break;
			}
		}

		if (!hasPotentialTarget)
		{
			return;
		}

		_properties.InitiativeForTurnOrderAdditional += 15;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.DamageType == this.Const.Damage.DamageType.Burning)
		{
			_properties.DamageReceivedRegularMult *= 0.66;
		}
	}

});

