this.perk_legend_item_horrify <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_item_horrify";
		this.m.Name = this.Const.Strings.PerkName.LegendHorrify;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorrify;
		this.m.Icon = "ui/perks/horrify56.png";
		this.m.IconDisabled = "ui/perks/horrify56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_horrific_scream"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_horrific_scream"));
		}
	}

	function onRemoved()
	{
		if (!this.m.Container.hasSkill("perk.legend_horrify"))
		{
			this.m.Container.removeByID("actives.legend_horrific_scream");
		}
	}

});

