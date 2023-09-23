this.legend_pie_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 5,
		Amount = 10
	},
	function setAmount( _a )
	{
		this.m.Amount = _a;
	}

	function create()
	{
		this.m.ID = "effects.legend_pie_effect";
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
		return "Thanks to eating pie, this character regains Health and Fatigue for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turn(s). ";
	}

	function getTooltip()
	{
		local rate = this.Math.floor(this.m.Amount / 10);
		local turns = this.m.TurnsLeft;
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
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "] +" + rate + "[/color] Healing per turn for " + turns + " more turns"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "] +" + rate + "[/color] Fatigue Recovery per turn for " + turns + " more turns"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "] +10 [/color] to morale checks for " + turns + " more turns"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		local rate = this.Math.floor(this.m.Amount / 10);
		_properties.MoraleCheckBravery[1] += 10;
		_properties.FatigueRecoveryRate += rate;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 5;
		this.getContainer().getActor().improveMood(0.2, "Ate pie");
	}

	function onTurnEnd()
	{
		local rate = this.Math.floor(this.m.Amount / 10);
		local actor = this.getContainer().getActor();
		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + rate));

		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});

