this.perk_legend_bribe <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_bribe";
		this.m.Name = this.Const.Strings.PerkName.LegendBribe;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBribe;
		this.m.Icon = "ui/perks/coins_circle.png";
		this.m.IconDisabled = "ui/perks/coins_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_bribe"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_bribe"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_bribe");
	}

});

