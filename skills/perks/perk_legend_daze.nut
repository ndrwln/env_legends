this.perk_legend_daze <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_daze";
		this.m.Name = this.Const.Strings.PerkName.LegendDaze;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDaze;
		this.m.Icon = "ui/perks/daze56_circle.png";
		this.m.IconDisabled = "ui/perks/daze56_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_daze"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_daze"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_daze");
	}

});

