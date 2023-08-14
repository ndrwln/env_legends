this.perk_legend_throw_sand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_throw_sand";
		this.m.Name = this.Const.Strings.PerkName.Sprint;
		this.m.Description = this.Const.Strings.PerkDescription.LegendThrowSand;
		this.m.Icon = "ui/perks/throw_sand_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.throw_dirt"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/throw_dirt_skill"));
		}
	}

});

