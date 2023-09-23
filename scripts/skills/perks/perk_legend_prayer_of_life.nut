this.perk_legend_prayer_of_life <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_prayer_of_life";
		this.m.Name = this.Const.Strings.PerkName.LegendPrayerOfLife;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPrayerOfLife;
		this.m.Icon = "ui/perks/prayer_green.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_prayer_of_life"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_prayer_of_life_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_prayer_of_life");
	}

});

