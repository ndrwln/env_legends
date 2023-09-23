this.perk_last_stand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.last_stand";
		this.m.Name = this.Const.Strings.PerkName.LastStand;
		this.m.Description = this.Const.Strings.PerkDescription.LastStand;
		this.m.Icon = "ui/perks/laststand_circle.png";
		this.m.IconDisabled = "ui/perks/laststand_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.getContainer().getActor().getHitpointsPct() >= 0.66;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		local currentPercent = this.getContainer().getActor().getHitpointsPct();

		if (currentPercent < 0.66)
		{
			local bonus = this.Math.floor(100 * (0.66 - currentPercent) / 2.0);
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Your melee and ranged defense are increased by [color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "[/color]."
			});

			if (currentPercent < 0.33)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Immune to the effects of fresh injuries, and not upset by health losses."
				});
			}
		}

		return tooltip;
	}

	function onUpdate( _properties )
	{
		local currentPercent = this.getContainer().getActor().getHitpointsPct();

		if (currentPercent < 0.66)
		{
			local bonus = this.Math.floor(100 * (0.66 - currentPercent) / 2.0);
			_properties.MeleeDefense += bonus;
			_properties.RangedDefense += bonus;

			if (currentPercent < 0.33)
			{
				_properties.IsAffectedByFreshInjuries = false;
				_properties.IsAffectedByLosingHitpoints = false;
			}
		}
	}

});

