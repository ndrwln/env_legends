this.perk_crusher <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.crusher";
		this.m.Name = this.Const.Strings.PerkName.Crusher;
		this.m.Description = this.Const.Strings.PerkDescription.Crusher;
		this.m.Icon = "ui/perks/perk_13.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

