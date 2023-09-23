this.perk_legend_scry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_scry";
		this.m.Name = this.Const.Strings.PerkName.LegendScry;
		this.m.Description = this.Const.Strings.PerkDescription.LegendScry;
		this.m.Icon = "ui/perks/scry_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_scry_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_scry_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_scry_skill");
	}

});

