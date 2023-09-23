this.legend_inventor_anatomy <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_inventor_anatomy";
		this.m.Name = "Anatomical Studies";
		this.m.Description = "Anatomical Studies";
		this.m.Icon = "ui/perks/legend_inventor_anatomy.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
		this.m.IsSerialized = true;
	}

});

