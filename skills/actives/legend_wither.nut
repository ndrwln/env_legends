this.legend_wither <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_wither";
		this.m.Name = "Wither";
		this.m.Description = "Wither a target for three turns, reducing their damage, fatigue and initiative by [color=" + this.Const.UI.Color.NegativeValue + "]-30%[/color]. The effect reduces by 10% each turn";
		this.m.Icon = "skills/wither56_skill.png";
		this.m.IconDisabled = "skills/wither56_skill_bw.png";
		this.m.Overlay = "wither";
		this.m.SoundOnHit = [
			"sounds/enemies/necromancer_01.wav",
			"sounds/enemies/necromancer_02.wav",
			"sounds/enemies/necromancer_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = true;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 6;
		this.m.MaxLevelDifference = 8;
	}

	function getTooltip()
	{
		return this.skill.getDefaultUtilityTooltip();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (target == null)
		{
			return;
		}

		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		target.getSkills().add(this.new("scripts/skills/effects/withered_effect"));

		if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has left " + this.Const.UI.getColorizedEntityName(target) + " withered");
		}
	}

});

