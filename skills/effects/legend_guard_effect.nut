this.legend_guard_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Target = null,
		IsAlive = true
	},
	function create()
	{
		this.m.ID = "effects.legend_guard";
		this.m.Name = "Guarding";
		this.m.Description = "Feels like there is someone that needs to be protected.";
		this.m.Icon = "skills/status_effect_103.png";
		this.m.IconMini = "status_effect_103_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function setTarget( _m )
	{
		if (typeof _m == "instance")
		{
			this.m.Target = _m;
		}
		else
		{
			this.m.Target = this.WeakTableRef(_m);
		}

		local actor = this.getContainer().getActor();
		local ai = actor.getAIAgent();
		local i;
		ai.removeBehavior(this.Const.AI.Behavior.ID.Protect);
		ai.removeBehavior(this.Const.AI.Behavior.ID.Rotation);
		local order = this.new("scripts/ai/tactical/behaviors/legend_ai_protect_target");
		order.setTarget(this.m.Target);
		ai.addBehavior(order);
		ai.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
	}

	function onUpdate( _properties )
	{
		if (this.m.Target == null)
		{
			this.removeSelf();
			return;
		}

		if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			this.removeSelf();
			return;
		}

		_properties.DamageReceivedTotalMult = 0.75;
		_properties.DamageDirectAdd += 0.15;
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();
		local ai = actor.getAIAgent();
		ai.removeBehavior(this.Const.AI.Behavior.ID.Protect);
		ai.removeBehavior(this.Const.AI.Behavior.ID.Rotation);
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_damageHitpoints >= this.getContainer().getActor().getHitpoints())
		{
			this.m.IsAlive = false;
			this.removeSelf();
		}
	}

});

