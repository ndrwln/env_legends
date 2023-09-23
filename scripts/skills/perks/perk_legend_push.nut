this.perk_legend_push <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_push";
		this.m.Name = this.Const.Strings.PerkName.LegendPush;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPush;
		this.m.Icon = "skills/revolt56.png";
		this.m.IconDisabled = "skills/revolt56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_revolt"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_revolt"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_revolt");
	}

});

