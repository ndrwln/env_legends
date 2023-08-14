this.perk_legend_drums_of_life <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_drums_of_life";
		this.m.Name = this.Const.Strings.PerkName.LegendDrumsOfLife;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDrumsOfLife;
		this.m.Icon = "ui/perks/drums_of_life.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_drums_of_life"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_drums_of_life_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_drums_of_life");
	}

});

