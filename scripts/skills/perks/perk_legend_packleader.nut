this.perk_legend_packleader <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_packleader";
		this.m.Name = this.Const.Strings.PerkName.LegendPackleader;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPackleader;
		this.m.Icon = "ui/perks/perk_dog.png";
		this.m.IconDisabled = "ui/perks/perk_dog_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

