this.perk_legend_rust <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_rust";
		this.m.Name = this.Const.Strings.PerkName.LegendRust;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRust;
		this.m.Icon = "ui/perks/rust56.png";
		this.m.IconDisabled = "ui/perks/rust56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_rust"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_rust"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_rust");
	}

});

