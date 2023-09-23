this.legend_vala_inscribe_helmet <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vala_inscribe_helmet";
		this.m.Name = "Rune Sigils: Helmets";
		this.m.Description = "";
		this.m.Icon = "ui/perks/legend_vala_inscribe_helmet.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 2;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
		this.m.IsSerialized = true;
	}

});

