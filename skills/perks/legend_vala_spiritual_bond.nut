this.legend_vala_spiritual_bond <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vala_spiritual_bond";
		this.m.Name = "Spiritual Bond";
		this.m.Description = "";
		this.m.Icon = "ui/perks/legend_vala_spiritual_bond.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

});

