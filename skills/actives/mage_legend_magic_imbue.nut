this.mage_legend_magic_imbue <- this.inherit("scripts/skills/actives/mage_legend_magic_skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.mage_legend_magic_Imbue";
		this.m.Name = "Imbue";
		this.m.Description = "Imbue someone with magical power, increasing accuracy and damage for 3 turns.";
		this.m.KilledString = "Imbued";
		this.m.Icon = "skills/magic_imbue_01.png";
		this.m.IconDisabled = "skills/magic_imbue_01_bw.png";
		this.m.Overlay = "mage_legend_magic_imbue_square";
		this.m.SoundOnUse = [
			"sounds/humans/0/human_fatigue_01.wav"
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
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.MaxLevelDifference = 6;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 4;
		this.m.ResolveScaling = 10;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increase hit chance and damage by [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getImbueAmount() + "[/color]%."
		});
		return ret;
	}

	function getImbueAmount()
	{
		return 5 + this.getResolveScaling();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (target.getSkills().hasSkill("effects.mage_legend_effect_imbue"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (!target.isAlive())
		{
			return;
		}

		if (target.getSkills().hasSkill("effects.mage_legend_effect_imbue"))
		{
			return;
		}

		local newImbue = this.new("scripts/skills/effects/mage_legend_effect_imbue");
		newImbue.setImbueAmount(this.getImbueAmount());
		target.getSkills().add(newImbue);

		if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " imbued " + this.Const.UI.getColorizedEntityName(target));
		}
	}

});

