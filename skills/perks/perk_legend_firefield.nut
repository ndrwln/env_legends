this.perk_legend_firefield <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_firefield";
		this.m.Name = this.Const.Strings.PerkName.LegendFirefield;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFirefield;
		this.m.Icon = "skills/fire_circle.png";
		this.m.IconDisabled = "skills/fire_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_firefield_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_firefield_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_firefield_skill");
	}

});

