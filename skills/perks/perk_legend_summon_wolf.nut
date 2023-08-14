this.perk_legend_summon_wolf <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_summon_wolf";
		this.m.Name = this.Const.Strings.PerkName.LegendSummonWolf;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSummonWolf;
		this.m.Icon = "ui/perks/wolf_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_unleash_wolf"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_unleash_wolf"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_unleash_wolf");
	}

});

