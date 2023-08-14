this.legend_hold_the_line <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_hold_the_line";
		this.m.Name = "Hold the line";
		this.m.Description = "Instruct your mercenaries to hold their ground! Grants the following bonuses to self and allies of your faction within 4 tiles.";
		this.m.Icon = "skills/holdtheline_square.png";
		this.m.IconDisabled = "skills/holdtheline_square_bw.png";
		this.m.Overlay = "holdtheline_square";
		this.m.SoundOnUse = [
			"sounds/combat/holdtheline_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.BeforeLast;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 9;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();
		tooltip.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Defense"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Receive only [color=" + this.Const.UI.Color.PositiveValue + "]90%[/color] of any damage"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/locked_small.png",
				text = "Gain immunity to being knocked back or grabbed"
			}
		]);
		return tooltip;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.legend_holding_the_line");
	}

	function onUse( _user, _targetTile )
	{
		local myTile = _user.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());

		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}

			if (myTile.getDistanceTo(a.getTile()) > 4)
			{
				continue;
			}

			if (a.getFaction() == _user.getFaction() && !a.getSkills().hasSkill("effects.holding_the_line"))
			{
				local effect = this.new("scripts/skills/effects/legend_holding_the_line");
				effect.setCommander(this.getContainer().getActor());
				a.getSkills().add(effect);
			}
		}

		local effect = this.new("scripts/skills/effects/legend_holding_the_line");
		effect.setCommander(this.getContainer().getActor());
		this.getContainer().add(effect);
		return true;
	}

});

