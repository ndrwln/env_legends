this.firearms_resistance_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "items.firearms_resistance";
		this.m.Type = this.Const.SkillType.Item;
		this.m.Order = this.Const.SkillOrder.Item;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsStacking = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill == null)
		{
			return;
		}

		if (_skill.getID() == "actives.fire_handgonne" || _skill.getID() == "actives.ignite_firelance" || _skill.getID() == "actives.fire_mortar")
		{
			_properties.DamageReceivedTotalMult *= 0.66;
		}
	}

});

