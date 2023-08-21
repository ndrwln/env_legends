this.direwolf_potion_effect <- this.inherit("scripts/skills/skill", {
	m = {
		SkillsUsed = {}
	},
	function create()
	{
		this.m.ID = "effects.direwolf_potion";
		this.m.Name = "Elasticized Sinew";
		this.m.Icon = "skills/status_effect_139.png";
		this.m.IconMini = "";
		this.m.Overlay = "status_effect_139";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "This character\'s muscles have mutated and respond differently to movement impulses. It is much less fatiguing to interrupt or stop mid-motion as a consequence, making it much easier to recover from errant or blocked attacks.";
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
				text = "Attacks that miss have [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of their Fatigue cost refunded"
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

	function getSkillsUsed()
	{
		return this.m.SkillsUsed;
	}

	function onTurnStarted()
	{
		this.m.SkillsUsed = {};
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (!(this.Const.SkillCounter in this.m.SkillsUsed))
		{
			this.m.SkillsUsed[this.Const.SkillCounter] <- _skill.getFatigueCost() / 2;
			local tag = {
				Actor = this.getContainer().getActor(),
				SkillCounter = this.Const.SkillCounter,
				Skill = this
			};
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 400, this.onTargedMissedCallback, tag);
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.Const.SkillCounter in this.m.SkillsUsed)
		{
			this.m.SkillsUsed[this.Const.SkillCounter] = 0;
		}
		else
		{
			this.m.SkillsUsed[this.Const.SkillCounter] <- 0;
		}
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		if (this.Const.SkillCounter in this.m.SkillsUsed)
		{
			this.m.SkillsUsed[this.Const.SkillCounter] = 0;
		}
		else
		{
			this.m.SkillsUsed[this.Const.SkillCounter] <- 0;
		}
	}

	function onTargedMissedCallback( _tag )
	{
		local SkillsUsed = _tag.Skill.getSkillsUsed();

		if ((_tag.SkillCounter in SkillsUsed) && _tag.Actor.isAlive() && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == _tag.Actor.getID())
		{
			_tag.Actor.setFatigue(_tag.Actor.getFatigue() - SkillsUsed[_tag.SkillCounter]);
			_tag.Actor.setDirty(true);
		}
	}

	function onDeath( _fatalityType )
	{
		if (_fatalityType != this.Const.FatalityType.Unconscious)
		{
			this.World.Statistics.getFlags().set("isDirewolfPotionAcquired", false);
		}
	}

	function onDismiss()
	{
		this.World.Statistics.getFlags().set("isDirewolfPotionAcquired", false);
	}

});

