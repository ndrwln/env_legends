this.perk_horse_bitting <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_bitting";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseBitting;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseBitting;
		this.m.Icon = "ui/perks/perk_08.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

