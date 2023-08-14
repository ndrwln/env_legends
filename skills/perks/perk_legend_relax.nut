this.perk_legend_relax <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_relax";
		this.m.Name = this.Const.Strings.PerkName.LegendRelax;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRelax;
		this.m.Icon = "ui/perks/relax_circle.png";
		this.m.IconDisabled = "ui/perks/relax_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_relax"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_relax"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_relax");
	}

});

