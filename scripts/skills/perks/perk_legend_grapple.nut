this.perk_legend_grapple <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_grapple";
		this.m.Name = this.Const.Strings.PerkName.LegendGrapple;
		this.m.Description = this.Const.Strings.PerkDescription.LegendGrapple;
		this.m.Icon = "ui/perks/grapple_circle.png";
		this.m.IconDisabled = "ui/perks/rapple_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_grapple"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_grapple"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_grapple");
	}

});

