this.perk_legend_doghandling <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_doghandling";
		this.m.Name = this.Const.Strings.PerkName.LegendDogHandling;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDogHandling;
		this.m.Icon = "ui/perks/dog_handling.png";
		this.m.IconDisabled = "ui/perks/dog_handling_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

