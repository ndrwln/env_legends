this.perk_legend_bearform <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_bearform";
		this.m.Name = this.Const.Strings.PerkName.LegendBearform;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBearform;
		this.m.Icon = "ui/perks/bear_circle.png";
		this.m.IconDisabled = "ui/perks/bear_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_transform_into_bear"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_transform_into_bear"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_transform_into_bear");
	}

});

