this.orc_berserker_potion_effect <- this.inherit("scripts/skills/skill", {
	m = {
		SkillCount = 0,
		RageStacks = 0
	},
	function create()
	{
		this.m.ID = "effects.orc_berserker_potion";
		this.m.Name = "Berserker Rage";
		this.m.Icon = "skills/status_effect_129.png";
		this.m.IconMini = "status_effect_129_mini";
		this.m.Overlay = "status_effect_129";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "This character\'s adrenaline and hormonal glands have mutated, causing a constant heightened emotional state. They can mostly keep this under control in camp, but in high-stress situations the effect is much stronger and fills them with an intense, unconsolable rage.";
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
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "This character gains two stacks of Rage each time they take hitpoint damage, and loses one stack at the end of each turn."
			},
			{
				id = 12,
				type = "hint",
				icon = "ui/tooltips/warning.png",
				text = "Further mutations will cause a longer period of sickness"
			}
		];

		if (this.m.RageStacks > 0)
		{
			ret.extend([
				{
					id = 12,
					type = "text",
					icon = "ui/icons/sturdiness.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + (100 - this.Math.maxf(0.3, 1.0 - 0.02 * this.m.RageStacks) * 100) + "%[/color] damage reduction"
				},
				{
					id = 12,
					type = "text",
					icon = "ui/icons/damage_dealt.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 1 * this.m.RageStacks + "[/color] damage dealt"
				},
				{
					id = 12,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 1 * this.m.RageStacks + "[/color] Resolve"
				},
				{
					id = 12,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 1 * this.m.RageStacks + "[/color] Initiative"
				}
			]);
		}

		return ret;
	}

	function addRage( _r )
	{
		this.m.RageStacks = this.Math.min(this.m.RageStacks + _r, 15);
		local actor = this.getContainer().getActor();

		if (!actor.isHiddenToPlayer())
		{
			this.spawnIcon("status_effect_143", actor.getTile());
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " gains rage!");
		}
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult *= this.Math.maxf(0.3, 1.0 - 0.02 * this.m.RageStacks);
		_properties.Bravery += 1 * this.m.RageStacks;
		_properties.DamageRegularMin += 1 * this.m.RageStacks;
		_properties.DamageRegularMax += 1 * this.m.RageStacks;
		_properties.Initiative += 1 * this.m.RageStacks;
	}

	function onTurnEnd()
	{
		this.m.RageStacks = this.Math.max(0, this.m.RageStacks - 1);
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (this.m.SkillCount == this.Const.SkillCounter)
		{
			return;
		}

		this.m.SkillCount = this.Const.SkillCounter;

		if (_attacker != null && _attacker.getID() != this.getContainer().getActor().getID() && _damageHitpoints > 0)
		{
			this.addRage(3);
		}
	}

	function onCombatStarted()
	{
		this.m.SkillCount = 0;
		this.m.RageStacks = 0;
	}

	function onCombatFinished()
	{
		this.m.SkillCount = 0;
		this.m.RageStacks = 0;
	}

	function onDeath( _fatalityType )
	{
		if (_fatalityType != this.Const.FatalityType.Unconscious)
		{
			this.World.Statistics.getFlags().set("isOrcBerserkerPotionAcquired", false);
		}
	}

	function onDismiss()
	{
		this.World.Statistics.getFlags().set("isOrcBerserkerPotionAcquired", false);
	}

});

