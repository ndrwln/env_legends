this.perk_legend_scroll_ingredients <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_scroll_ingredients";
		this.m.Name = this.Const.Strings.PerkName.LegendScrollIngredients;
		this.m.Description = this.Const.Strings.PerkDescription.LegendScrollIngredients;
		this.m.Icon = "ui/perks/scroll_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

