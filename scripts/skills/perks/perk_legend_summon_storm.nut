this.perk_legend_summon_storm <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_summon_storm";
		this.m.Name = this.Const.Strings.PerkName.LegendSummonStorm;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSummonStorm;
		this.m.Icon = "ui/perks/rain_circle.png";
		this.m.IconDisabled = "ui/perks/rain_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_summon_storm"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_summon_storm"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_summon_storm");
	}

});

