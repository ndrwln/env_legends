this.perk_legend_levitation <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_levitation";
		this.m.Name = this.Const.Strings.PerkName.LegendLevitate;
		this.m.Description = this.Const.Strings.PerkDescription.LegendLevitate;
		this.m.Icon = "ui/perks/levitate.png";
		this.m.IconDisabled = "ui/perks/levitate_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_levitate_person"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_levitate_person"));
		}
	}

	function onRemoved()
	{
		if (this.m.Container.hasSkill("actives.legend_levitate_person"))
		{
			this.m.Container.removeByID("actives.legend_levitate_person");
		}
	}

});

