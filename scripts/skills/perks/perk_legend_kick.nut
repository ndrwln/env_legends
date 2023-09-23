this.perk_legend_kick <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_kick";
		this.m.Name = this.Const.Strings.PerkName.LegendKick;
		this.m.Description = this.Const.Strings.PerkDescription.LegendKick;
		this.m.Icon = "ui/perks/kick_circle.png";
		this.m.IconDisabled = "ui/perks/kick_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_kick"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_kick"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_kick");
	}

});

