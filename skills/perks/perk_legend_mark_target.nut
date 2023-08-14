this.perk_legend_mark_target <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mark_target";
		this.m.Name = this.Const.Strings.PerkName.LegendMarkTarget;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMarkTarget;
		this.m.Icon = "ui/perk/MarkTargetPerk.png";
		this.m.IconDisabled = "ui/perks/MarkTargetPerk_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_mark_target"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_mark_target"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_mark_target");
	}

});

