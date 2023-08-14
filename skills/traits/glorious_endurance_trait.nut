this.glorious_endurance_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {
		DamageReduction = 0.0
	},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.glorious";
		this.m.Name = "Glorious Endurance";
		this.m.Icon = "ui/traits/trait_icon_70.png";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
	}

	function getDescription()
	{
		return "Forged in the arenas of the south, this character has fought many a battle, and every blow will only strengthen their indomitable will and endurance. This fabulous lifestyle demands high pay, but they\'ll never desert you and can\'t be dismissed. If all three original members should die, your campaign ends.";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		if (this.m.DamageReduction > 0.0)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Receives only [color=" + this.Const.UI.Color.PositiveValue + "]" + (1.0 - this.m.DamageReduction) * 100 + "%[/color] of any damage"
			});
		}

		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Gains 5% damage reduction with every hit taken, up to a limit of 25%"
		});
		return ret;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_attacker != null && _attacker.getID() != this.getContainer().getActor().getID())
		{
			this.m.DamageReduction = this.Math.minf(0.25, this.m.DamageReduction + 0.05);
			this.m.Type = this.Const.SkillType.Trait | this.Const.SkillType.StatusEffect;
		}
	}

	function onCombatStarted()
	{
		this.m.DamageReduction = 0.0;
		this.m.Type = this.Const.SkillType.Trait;
	}

	function onCombatFinished()
	{
		this.m.DamageReduction = 0.0;
		this.m.Type = this.Const.SkillType.Trait;
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult *= 1.0 - this.m.DamageReduction;
	}

});

