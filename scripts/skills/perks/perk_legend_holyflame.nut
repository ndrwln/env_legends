this.perk_legend_holyflame <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_holyflame";
		this.m.Name = this.Const.Strings.PerkName.LegendHolyFlame;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHolyFlame;
		this.m.Icon = "ui/perks/holyfire_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_holyflame"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_holyflame_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_holyflame");
	}

});

