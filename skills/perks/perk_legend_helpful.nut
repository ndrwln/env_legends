this.perk_legend_helpful <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_helpful";
		this.m.Name = this.Const.Strings.PerkName.LegendHelpful;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHelpful;
		this.m.Icon = "ui/perks/helpful.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_pass"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_pass_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_pass");
	}

});

