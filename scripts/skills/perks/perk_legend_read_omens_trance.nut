this.perk_legend_read_omens_trance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_read_omens_trance";
		this.m.Name = this.Const.Strings.PerkName.LegendReadOmensTrance;
		this.m.Description = this.Const.Strings.PerkDescription.LegendReadOmensTrance;
		this.m.Icon = "ui/perks/omens_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_read_omens_trance"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_read_omens_trance_skill"));
		}
	}

});

