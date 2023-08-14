this.legend_field_treats <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_field_treats";
		this.m.Name = "Field Treats";
		this.m.Description = "Restore confidence through liberal application of alcohol and food, taking someone from wavering to steady for 20 food.";
		this.m.Icon = "skills/drink_sqaure.png";
		this.m.IconDisabled = "skills/drink_sqaure_bw.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/combat/drink_01.wav",
			"sounds/combat/drink_02.wav",
			"sounds/combat/drink_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 16;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 8,
			type = "text",
			icon = "ui/icons/asset_money.png",
			text = "You have [color=" + this.Const.UI.Color.PositiveValue + "]" + this.World.Assets.getFood() + "[/color] food."
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/asset_money.png",
			text = "Spend [color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] food to raise moral state of adjacent ally from wavering to steady."
		});
		return ret;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		local food = this.World.Assets.getFood();

		if (food < 20)
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local food = this.World.Assets.getFood();

		if (food < 20)
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (target == null)
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (target.getMoraleState() >= this.Const.MoraleState.Steady)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local food = this.World.Assets.getFood();
		local a = _targetTile.getEntity();
		a.changeMorale(this.Const.MoraleState.Steady, "status_effect_56");
		local food = this.World.Assets.getFoodItems();

		for( local i = 0; i < 2; i = i )
		{
			local idx = this.Math.rand(0, food.len() - 1);
			local item = food[idx];
			this.World.Assets.getStash().remove(item);
			food.remove(idx);
			i = ++i;
		}

		this.World.Assets.updateFood();
		return true;
	}

});

