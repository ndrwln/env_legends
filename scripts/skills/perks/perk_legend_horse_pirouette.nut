this.perk_legend_horse_pirouette <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_pirouette";
		this.m.Name = this.Const.Strings.PerkName.LegendHorsePirouette;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorsePirouette;
		this.m.Icon = "ui/perks/perk_25.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_horse_pirouette"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_horse_pirouette"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_horse_pirouette");
	}

});

