this.perk_legend_leap <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_leap";
		this.m.Name = this.Const.Strings.PerkName.LegendLeap;
		this.m.Description = this.Const.Strings.PerkDescription.LegendLeap;
		this.m.Icon = "ui/perks/leap_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_leap"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_leap"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_leap");
	}

});

