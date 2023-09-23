this.perk_legend_roots <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_roots";
		this.m.Name = this.Const.Strings.PerkName.LegendRoots;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRoots;
		this.m.Icon = "ui/perks/roots_circle.png";
		this.m.IconDisabled = "ui/perks/roots_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_root"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_root_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_root");
	}

});

