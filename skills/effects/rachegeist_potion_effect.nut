this.rachegeist_potion_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.rachegeist_potion";
		this.m.Name = "Ghastly Aura";
		this.m.Icon = "skills/status_effect_153.png";
		this.m.IconMini = "status_effect_153_mini";
		this.m.Overlay = "status_effect_153";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "This character has consumed a substance, now in their bloodstream, that emits a kinetic field. This field gets stronger as their health deteriorates, eventually emitting a blue shimmer and producing a noticable effect on any blows that they deal, or that are dealt to them. They also claim to hear a constant, almost imperceptible whisper when alone, but that\'s probably superstition.";
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
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] Damage if hitpoints are below [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Receives only [color=" + this.Const.UI.Color.PositiveValue + "]75%[/color] of any damage if hitpoints are below [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color]"
			},
			{
				id = 12,
				type = "hint",
				icon = "ui/tooltips/warning.png",
				text = "Further mutations will cause a longer period of sickness"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.getHitpoints() < actor.getHitpointsMax() / 2)
		{
			_properties.DamageTotalMult *= 1.25;
			_properties.DamageReceivedTotalMult *= 0.75;
		}
	}

	function onDeath( _fatalityType )
	{
		if (_fatalityType != this.Const.FatalityType.Unconscious)
		{
			this.World.Statistics.getFlags().set("isRachegeistPotionAcquired", false);
		}
	}

	function onDismiss()
	{
		this.World.Statistics.getFlags().set("isRachegeistPotionAcquired", false);
	}

});

