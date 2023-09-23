this.perk_legend_summon_cat <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_summon_cat";
		this.m.Name = this.Const.Strings.PerkName.LegendSummonCat;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSummonCat;
		this.m.Icon = "ui/perks/cat_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_unleash_cat"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_unleash_cat"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_unleash_cat");
	}

});

