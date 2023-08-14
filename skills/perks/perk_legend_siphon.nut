this.perk_legend_siphon <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_siphon";
		this.m.Name = this.Const.Strings.PerkName.LegendSiphon;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSiphon;
		this.m.Icon = "ui/perks/siphon_circle.png";
		this.m.IconDisabled = "ui/perks/siphon_circle_bw.png";
		this.m.Overlay = "active_42";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_siphon"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_siphon_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_siphon");
	}

});

