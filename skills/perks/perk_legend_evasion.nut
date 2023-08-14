this.perk_legend_evasion <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_evasion";
		this.m.Name = this.Const.Strings.PerkName.LegendEvasion;
		this.m.Description = this.Const.Strings.PerkDescription.LegendEvasion;
		this.m.Icon = "ui/perks/evasion_circle.png";
		this.m.IconDisabled = "ui/perks/evasion_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_evasion"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_evasion"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_evasion");
	}

});

