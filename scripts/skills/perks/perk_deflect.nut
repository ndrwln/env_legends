this.perk_deflect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.deflect";
		this.m.Name = this.Const.Strings.PerkName.Deflect;
		this.m.Description = this.Const.Strings.PerkDescription.Deflect;
		this.m.Icon = "ui/perks/perk_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

