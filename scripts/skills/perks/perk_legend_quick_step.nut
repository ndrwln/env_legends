this.perk_legend_quick_step <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_quick_step";
		this.m.Name = "Quick Step";
		this.m.Description = "Exert yourself to move one tile at an unusually quick speed.";
		this.m.Icon = "ui/perks/unarmed_lunge.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_quick_step"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_quick_step"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_quick_step");
	}

});

