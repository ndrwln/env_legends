this.perk_legend_climb <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_climb";
		this.m.Name = this.Const.Strings.PerkName.LegendClimb;
		this.m.Description = this.Const.Strings.PerkDescription.LegendClimb;
		this.m.Icon = "ui/perks/climb_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.footwork"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_climb"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_climb");
	}

});

