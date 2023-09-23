this.curseofyears_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsCurseofyears = 0
	},
	function getTurnsCurseofyears()
	{
		return this.m.TurnsCurseofyears;
	}

	function create()
	{
		this.m.ID = "effects.curseofyears";
		this.m.Name = "Decrepify";
		this.m.KilledString = "Died over time";
		this.m.Icon = "skills/status_effect_81.png";
		this.m.IconMini = "status_effect_81_mini";
		this.m.Overlay = "status_effect_81";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/nightmare_01.wav",
			"sounds/enemies/dlc2/nightmare_02.wav",
			"sounds/enemies/dlc2/nightmare_03.wav",
			"sounds/enemies/dlc2/nightmare_04.wav",
			"sounds/enemies/dlc2/nightmare_05.wav",
			"sounds/enemies/dlc2/nightmare_06.wav",
			"sounds/enemies/dlc2/nightmare_07.wav",
			"sounds/enemies/dlc2/nightmare_08.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is consumed by unnatural nightmares and is unable to act. As the horror eats away his sanity, he\'ll take [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getDamage() + "[/color] damage based on his resolve each turn. The character can be forcibly awoken from these nightmares by a nearby ally, but he won\'t wake up on his own.";
	}

	function getTooltip()
	{
		return [
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
				id = 9,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]aging over time[/color] "
			}
		];
	}

	function getDamage()
	{
		local actor = this.getContainer().getActor();
		return this.Math.max(10, actor.getHitpointsMax());
	}

	function applyDamage()
	{
		local actor = this.getContainer().getActor();

		for( local i = 0; i < 99; i = i )
		{
			if (actor.isAlive() && this.Math.rand(1, 6) >= this.Math.max(2, 7 - this.getTurnsCurseofyears()))
			{
				this.spawnIcon("status_effect_81", this.getContainer().getActor().getTile());
				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = this.getDamage();
				hitInfo.DamageDirect = 1.0;
				hitInfo.BodyPart = this.Const.BodyPart.Body;
				hitInfo.BodyDamageMult = 0.02 + this.getTurnsCurseofyears();
				hitInfo.FatalityChanceMult = 0.0;
				this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
			}
			else
			{
				break;
			}

			i = ++i;
		}
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.getFlags().set("Curseofyears", true);

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}
	}

	function onBeforeActivation()
	{
		local BreakChance = 6;

		if (this.Math.rand(1, 9) > BreakChance)
		{
			this.removeSelf();
		}

		++this.m.TurnsCurseofyears;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}
	}

	function onResumeTurn()
	{
		this.onTurnStart();
	}

	function onTurnEnd()
	{
		this.applyDamage();
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();

		if (actor.hasSprite("status_stunned"))
		{
			actor.getSprite("status_stunned").Visible = false;
		}

		actor.getFlags().set("curseofyears", false);
		actor.setDirty(true);
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.hasSprite("status_stunned"))
		{
			actor.getSprite("status_stunned").setBrush("bust_nightmare");
			actor.getSprite("status_stunned").Visible = true;
		}

		actor.setDirty(true);
	}

});

