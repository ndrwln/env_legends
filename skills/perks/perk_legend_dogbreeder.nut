this.perk_legend_dogbreeder <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_dogbreeder";
		this.m.Name = this.Const.Strings.PerkName.LegendDogBreeder;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDogBreeder;
		this.m.Icon = "ui/perks/perk_dogs.png";
		this.m.IconDisabled = "ui/perks/perk_dogs_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

