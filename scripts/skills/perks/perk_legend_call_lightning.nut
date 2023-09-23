this.perk_legend_call_lightning <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_call_lightning";
		this.m.Name = this.Const.Strings.PerkName.LegendCallLightning;
		this.m.Description = this.Const.Strings.PerkDescription.LegendCallLightning;
		this.m.Icon = "ui/perks/storm_circle.png";
		this.m.IconDisabled = "ui/perks/storm_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_call_lightning"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_call_lightning"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_call_lightning");
	}

});

