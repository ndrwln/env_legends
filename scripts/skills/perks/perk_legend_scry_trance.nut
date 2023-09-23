this.perk_legend_scry_trance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_scry_trance";
		this.m.Name = this.Const.Strings.PerkName.LegendScryTrance;
		this.m.Description = this.Const.Strings.PerkDescription.LegendScryTrance;
		this.m.Icon = "ui/perks/perk_34.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_scry_trance"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_scry_trance_skill"));
		}
	}

});

