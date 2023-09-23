this.perk_legend_prepare_graze <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_prepare_graze";
		this.m.Name = this.Const.Strings.PerkName.LegendPrepareGraze;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPrepareGraze;
		this.m.Icon = "ui/perks/graze_circle.png";
		this.m.IconDisabled = "ui/perks/graze_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_prepare_graze_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_prepare_graze_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_prepare_graze_skill");
	}

});

