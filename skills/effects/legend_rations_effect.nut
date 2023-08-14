this.legend_rations_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 10,
		Amount = 0
	},
	function setAmount( _a )
	{
		this.m.Amount = _a;
	}

	function addAmount( _a )
	{
		this.m.Amount = this.Math.max(0, this.m.Amount - (10 - this.m.TurnsLeft)) + _a;
	}

	function getTurnsLeft()
	{
		return this.m.TurnsLeft;
	}

	function resetTurns()
	{
		this.m.TurnsLeft = 10;
	}

	function getAmount()
	{
		return this.m.Amount;
	}

	function create()
	{
		this.m.ID = "effects.legend_rations_effect";
		this.m.Name = "Satiated";
		this.m.Icon = "skills/status_effect_61.png";
		this.m.IconMini = "status_effect_61_mini";
		this.m.Overlay = "status_effect_61";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "Thanks to eating food, this character regains Health and loses Fatigue for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turn(s). ";
	}

	function getTooltip()
	{
		local rate = this.Math.max(1, this.Math.floor(this.m.Amount / 10));
		local turns = this.m.TurnsLeft;
		local title = this.getName();
		local actor = this.getContainer().getActor();

		if (actor != null)
		{
			local stuffed = actor.getSkills().getSkillByID("effects.legend_stuffed_effect");

			if (stuffed != null)
			{
				title = "Stuffed";
				rate = rate * 2;
				local sick = actor.getSkills().getSkillByID("injury.sickness");

				if (sick != null)
				{
					title = "Overate";
				}
			}
		}

		local ret = [
			{
				id = 1,
				type = "title",
				text = title
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "] +" + rate + "[/color] Healing per turn for " + turns + " turns "
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "] -" + rate + "[/color] Fatigue Recovery per turn for " + turns + " turns"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		local rate = this.Math.max(1, this.Math.floor(this.m.Amount / 10));
		_properties.FatigueRecoveryRate -= rate;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 10;
	}

	function onTurnEnd()
	{
		local rate = this.Math.max(1, this.Math.floor(this.m.Amount / 10));
		local actor = this.getContainer().getActor();
		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + rate));

		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});

