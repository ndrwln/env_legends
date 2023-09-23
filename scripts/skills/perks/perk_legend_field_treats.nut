this.perk_legend_field_treats <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_field_treats";
		this.m.Name = this.Const.Strings.PerkName.LegendFieldTreats;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFieldTreats;
		this.m.Icon = "ui/perks/drink_circle.png";
		this.m.IconDisabled = "ui/perks/drink_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_field_treats"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_field_treats"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_field_treats");
	}

});

