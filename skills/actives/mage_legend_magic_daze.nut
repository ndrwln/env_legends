this.mage_legend_magic_daze <- this.inherit("scripts/skills/actives/mage_legend_magic_skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.mage_legend_magic_daze";
		this.m.Name = "Daze";
		this.m.Description = "Assault the senses of your target with a conjured flurry of colorful sparks, whirs, and pops. Such an astonishing display is sure to leave anyone too bewildered to fight effectively. Does no damage.";
		this.m.KilledString = "Dazed";
		this.m.Icon = "skills/daze_square.png";
		this.m.IconDisabled = "skills/daze_square_bw.png";
		this.m.Overlay = "daze_square";
		this.m.SoundOnUse = [
			"sounds/combat/stupefy_01.wav",
			"sounds/combat/stupefy_02.wav",
			"sounds/combat/stupefy_03.wav",
			"sounds/combat/stupefy_04.wav",
			"sounds/combat/stupefy_05.wav"
		];
		this.m.SoundOnHit = [
			"sounds/humans/0/human_fatigue_01.wav",
			"sounds/humans/0/human_fatigue_01.wav",
			"sounds/humans/0/human_fatigue_01.wav",
			"sounds/humans/0/human_fatigue_01.wav"
		];
		this.m.SoundVolume = 1.25;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 12;
		this.m.MinRange = 1;
		this.m.MaxRange = 4;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Leave your opponent bewildered, halving their damage, fatigue and initiative"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Hit chance based on resolve. (Displayed hit chance probably wrong)."
		});
		return ret;
	}

	function makeDazeCheck( _target )
	{
		local targetResolve = _target.getCurrentProperties().getBravery();
		local chance = this.Math.round(40 + (this.getCurrentResolve() - targetResolve) / 2);

		if (chance > 100)
		{
			chance = 100;
		}

		if (chance < 0)
		{
			chance = 0;
		}

		local roll = this.Math.rand(1, 100);
		local ret = {
			Roll = roll,
			Chance = chance,
			Result = roll <= chance
		};
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local ret = this.makeDazeCheck(targetEntity);
		local logString = this.Const.UI.getColorizedEntityName(_user) + " tries to daze " + this.Const.UI.getColorizedEntityName(targetEntity) + " (Chance: " + ret.Chance + ", Rolled: " + ret.Roll + ")\n";

		if (ret.Result)
		{
			this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);

			if (targetEntity.isAlive())
			{
				local newDaze = this.new("scripts/skills/effects/legend_dazed_effect");
				targetEntity.getSkills().add(newDaze);
				newDaze.m.TurnsLeft = this.Math.max(1, 1 + newDaze.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);

				if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(logString + this.Const.UI.getColorizedEntityName(_user) + " stupefied " + this.Const.UI.getColorizedEntityName(targetEntity) + " leaving them dazed");
				}
			}
		}
		else
		{
			this.Tactical.EventLog.log(logString + this.Const.UI.getColorizedEntityName(_user) + " failed to stupefy " + this.Const.UI.getColorizedEntityName(targetEntity));
		}
	}

});

