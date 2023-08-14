this.perk_legend_raise_undead <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_raise_undead";
		this.m.Name = this.Const.Strings.PerkName.LegendRaiseUndead;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRaiseUndead;
		this.m.Icon = "skills/active_26.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_raise_undead"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_raise_undead"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_raise_undead");
	}

});

