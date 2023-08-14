this.perk_legend_sleep <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_sleep";
		this.m.Name = this.Const.Strings.PerkName.LegendSleep;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSleep;
		this.m.Icon = "ui/perks/sleep56.png";
		this.m.IconDisabled = "ui/perks/sleep56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_sleep"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_sleep_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_sleep");
	}

});

