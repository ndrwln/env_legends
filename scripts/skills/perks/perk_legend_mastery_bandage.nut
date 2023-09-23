this.perk_legend_mastery_bandage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mastery_bandage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecBandage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecBandage;
		this.m.Icon = "ui/perks/bandage_circle.png";
		this.m.IconDisabled = "ui/perks/bandage_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_bandage"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_bandage"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_bandage");
	}

});

