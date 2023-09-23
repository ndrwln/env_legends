this.perk_horse_liberty <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_liberty";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseLiberty;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseLiberty;
		this.m.Icon = "ui/perks/perk_08.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

