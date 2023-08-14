this.perk_legend_violent_decomposition <- this.inherit("scripts/skills/skill", {
	m = {
		LootChance = 30
	},
	function create()
	{
		this.m.ID = "perk.legend_violent_decomposition";
		this.m.Name = this.Const.Strings.PerkName.LegendViolentDecomposition;
		this.m.Description = this.Const.Strings.PerkDescription.LegendViolentDecomposition;
		this.m.Icon = "ui/perks/possess56.png";
		this.m.IconDisabled = "ui/perks/possess56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_violent_decomposition_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_violent_decomposition_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_violent_decomposition_skill");
	}

});

