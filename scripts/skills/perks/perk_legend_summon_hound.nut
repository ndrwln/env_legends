this.perk_legend_summon_hound <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_summon_hound";
		this.m.Name = this.Const.Strings.PerkName.LegendSummonHound;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSummonHound;
		this.m.Icon = "ui/perks/dog_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_unleash_hound"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_unleash_hound"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_unleash_hound");
	}

});

