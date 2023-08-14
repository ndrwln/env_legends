this.perk_legend_field_triage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_field_triage";
		this.m.Name = this.Const.Strings.PerkName.LegendFieldTriage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFieldTriage;
		this.m.Icon = "ui/perks/MaxMedsT1.png";
		this.m.IconDisabled = "ui/perks/MaxMedsT1_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_field_triage"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_field_triage"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_field_triage");
	}

});

