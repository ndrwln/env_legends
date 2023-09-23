this.legend_ritual_abstract <- this.inherit("scripts/skills/skill", {
	m = {
		IsInRitual = false,
		BaseTurns = 5,
		TurnsLeft = 0,
		IsSameTurn = false,
		BaseFatigueCost = 50,
		BaseAPCost = 5,
		ToggleOnDescription = "",
		ToggleOffDescription = ""
	},
	function create()
	{
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = this.m.BaseAPCost;
		this.m.FatigueCost = this.m.BaseFatigueCost;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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
			}
		];
		return ret;
	}

	function onCombatFinished()
	{
		this.m.IsInRitual = false;
		this.m.IsSameTurn = false;
		this.m.TurnsLeft = this.m.BaseTurns;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.m.IsSameTurn;
	}

	function castRitual()
	{
	}

	function onTurnStart()
	{
		if (this.m.IsInRitual)
		{
			this.m.TurnsLeft -= 1;

			if (this.m.TurnsLeft == 0)
			{
				this.castRitual();
			}

			this.m.IsSameTurn = false;
		}
	}

	function onUse( _user, _targetTile )
	{
		if (this.m.IsInRitual)
		{
			this.swapOff();
		}
		else
		{
			this.swapOn();
		}

		this.m.IsInRitual = !this.m.IsInRitual;
		return true;
	}

	function onUpdate( _properties )
	{
		if (_properties.IsStunned)
		{
			if (this.m.IsInRitual)
			{
				this.m.TurnsLeft = this.m.BaseTurns;
				this.m.IsInRitual = false;
				this.m.IsSameTurn = false;
				this.m.swapOff();
			}
		}
	}

	function swapOn()
	{
		this.m.Description = this.m.ToggleOffDescription;
		this.getContainer().getActor().setActionPoints(0);
		this.m.FatigueCost = 0;
		this.m.ActionPointCost = 0;
		this.m.TurnsLeft = this.m.BaseTurns;
		this.m.IsSameTurn = true;
	}

	function swapOff()
	{
		this.m.Description = this.m.ToggleOnDescription;
		this.m.FatigueCost = this.m.BaseFatigueCost;
		this.m.ActionPointCost = this.m.BaseAPCost;
		this.removeAll();
	}

});

