this.legend_danger_pay <- this.inherit("scripts/skills/skill", {
	m = {
		Multiplier = 10,
		MinCost = 0,
		MaxCost = 0,
		MaximumMoraleState = this.Const.MoraleState.Confident
	},
	function create()
	{
		this.m.ID = "actives.legend_danger_pay";
		this.m.Name = "Danger Pay";
		this.m.Description = "Pay a unit " + this.m.Multiplier + "x their daily wage to set their morale to Confident and granting them the buff \'Motivated\' for three turns.";
		this.m.Icon = "skills/coins_square.png";
		this.m.IconDisabled = "skills/coins_square_bw.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/coins_01.wav",
			"sounds/coins_02.wav",
			"sounds/coins_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 4;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		this.calculateMinMax();
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color]."
		});
		ret.push({
			id = 8,
			type = "text",
			icon = "ui/icons/asset_money.png",
			text = "This will cost between [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MinCost + "[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxCost + "[/color]"
		});
		ret.push({
			id = 9,
			type = "text",
			icon = "ui/icons/asset_money.png",
			text = "You have currently have " + this.World.Assets.getMoney() + " crowns."
		});
		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (this.getContainer().getActor().getFaction() != target.getFaction())
		{
			return false;
		}

		if (!target.getFlags().has("human"))
		{
			return false;
		}

		if (("getDailyCost" in target) == false)
		{
			return false;
		}

		if (this.getCrownCost(target) <= 0)
		{
			return false;
		}

		if (this.World.Assets.getMoney() < this.getCrownCost(target))
		{
			return false;
		}

		if (target.getMoraleState() >= this.m.MaximumMoraleState && target.getSkills().hasSkill("effects.legend_motivated_effect"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		target.getSkills().add(this.new("scripts/skills/effects/legend_motivated_effect"));
		target.setMoraleState(this.m.MaximumMoraleState);
		local crownCost = this.getCrownCost(target);
		this.World.Assets.addMoney(crownCost * -1);
		this.Tactical.EventLog.log_newline();
		this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " on " + this.Const.UI.getColorizedEntityName(target) + " and paid " + crownCost + " Crowns for it.");
		return true;
	}

	function getCrownCost( _brother )
	{
		local wage = _brother.getDailyCost();
		wage = wage * this.m.Multiplier;
		return this.Math.floor(wage);
	}

	function calculateMinMax()
	{
		local roster = this.World.getPlayerRoster().getAll();
		this.m.MinCost = this.getCrownCost(::MSU.Table.randValue(roster));
		this.m.MaxCost = this.m.MinCost;

		foreach( bro in roster )
		{
			local newCrownCost = this.getCrownCost(bro);

			if (newCrownCost == 0)
			{
				continue;
			}

			if (newCrownCost > this.m.MaxCost)
			{
				this.m.MaxCost = newCrownCost;
			}

			if (newCrownCost < this.m.MinCost || this.m.MinCost == 0)
			{
				this.m.MinCost = newCrownCost;
			}
		}
	}

});

