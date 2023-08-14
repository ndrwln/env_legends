this.perk_legend_reclamation <- this.inherit("scripts/skills/skill", {
	m = {
		LootChance = 20
	},
	function create()
	{
		this.m.ID = "perk.legend_reclamation";
		this.m.Name = this.Const.Strings.PerkName.LegendReclamation;
		this.m.Description = this.Const.Strings.PerkDescription.LegendReclamation;
		this.m.Icon = "ui/perks/possess56.png";
		this.m.IconDisabled = "ui/perks/possess56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

