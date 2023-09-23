this.legend_vala_spiritual_bond_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null
	},
	function setVala( _v )
	{
		if (typeof _v == "instance")
		{
			this.m.Vala = _v;
		}
		else
		{
			this.m.Vala = this.WeakTableRef(_v);
		}
	}

	function create()
	{
		this.m.ID = "effects.legend_vala_spiritual_bond_effect";
		this.m.Name = "Spiritual Bond";
		this.m.Description = "";
		this.m.Icon = "skills/status_effect_87.png";
		this.m.IconMini = "status_effect_87_mini";
		this.m.Overlay = "status_effect_87";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function isHidden()
	{
		return true;
	}

	function getTooltip()
	{
		if (!this.isHidden())
		{
			return [
				{
					id = 1,
					type = "title",
					text = this.getName()
				}
			];
		}
		else
		{
			return;
		}
	}

	function onUpdate( _properties )
	{
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill != null && !_skill.isAttack())
		{
			return;
		}

		if (this.m.Vala.m.WardenEntity == null)
		{
			return;
		}

		local reduction = 1.0 - (0.1 + this.getContainer().getActor().getBravery() / 400.0);

		if (reduction < 0.5)
		{
			reduction = 0.5;
		}

		_properties.DamageReceivedRegularMult *= reduction;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (this.m.Vala.m.WardenEntity == null)
		{
			return;
		}

		if (_damageHitpoints < 1)
		{
			return;
		}

		local reduction = 1.0 - (0.1 + this.getContainer().getActor().getBravery() / 400.0);
		local transfer = 0.1 + this.getContainer().getActor().getBravery() / 400.0;

		if (reduction < 0.5)
		{
			reduction = 0.5;
		}

		if (transfer > 0.5)
		{
			transfer = 0.5;
		}

		local DamageToWarden = _damageHitpoints / reduction * transfer;
		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = this.Math.ceil(DamageToWarden);
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;
		this.m.Vala.m.WardenEntity.onDamageReceived(_attacker, this, hitInfo);
	}

});

