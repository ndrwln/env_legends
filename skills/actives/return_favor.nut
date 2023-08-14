this.return_favor <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "actives.return_favor";
		this.m.Name = "Return Favor";
		this.m.Description = "Use your superior fighting skills to assume a defensive stance and seek to incapacitate anyone attacking you that you can reach yourself.";
		this.m.Icon = "skills/return_favor_square.png";
		this.m.IconDisabled = "skills/return_favor_square_bw.png";
		this.m.Overlay = "perk_31_active";
		this.m.SoundOnUse = [
			"sounds/combat/return_favor_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Gain a [color=" + this.Const.UI.Color.PositiveValue + "]75%[/color] chance to stun any opponent missing this character with a melee attack (resistances and immunities still apply)."
			}
		];
		return ret;
	}

	function isUsable()
	{
		return !this.m.IsSpent && this.skill.isUsable();
	}

	function onUse( _user, _targetTile )
	{
		if (!this.m.IsSpent)
		{
			this.m.Container.add(this.new("scripts/skills/effects/return_favor_effect"));
			this.m.IsSpent = true;
			return true;
		}

		return false;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

});

