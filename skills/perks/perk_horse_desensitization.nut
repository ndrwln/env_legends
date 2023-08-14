this.perk_horse_desensitization <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_desensitization";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseDesensitization;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseDesensitization;
		this.m.Icon = "ui/perks/perk_08.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

