this.legend_vala_inscription_mastery <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vala_inscription_mastery";
		this.m.Name = "Inscription Mastery";
		this.m.Description = "";
		this.m.Icon = "ui/perks/legend_vala_inscription_mastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

});

