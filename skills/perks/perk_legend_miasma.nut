this.perk_legend_miasma <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_miasma";
		this.m.Name = this.Const.Strings.PerkName.LegendMiasma;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMiasma;
		this.m.Icon = "ui/perks/miasma_circle.png";
		this.m.IconDisabled = "ui/perks/miasma_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_miasma_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_miasma_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_miasma");
	}

});

