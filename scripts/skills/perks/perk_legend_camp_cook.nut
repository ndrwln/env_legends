this.perk_legend_camp_cook <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_camp_cook";
		this.m.Name = this.Const.Strings.PerkName.LegendCampCook;
		this.m.Description = this.Const.Strings.PerkDescription.LegendCampCook;
		this.m.Icon = "ui/perks/cooking_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

