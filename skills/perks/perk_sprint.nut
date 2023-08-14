this.perk_sprint <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.sprint";
		this.m.Name = this.Const.Strings.PerkName.Sprint;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSprint;
		this.m.Icon = "ui/perks/perk_sprint.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.sprint"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/sprint_skill_5"));
		}
	}

});

