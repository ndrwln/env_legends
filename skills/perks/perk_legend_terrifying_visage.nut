this.perk_legend_terrifying_visage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_terrifying_visage";
		this.m.Name = this.Const.Strings.PerkName.LegendTerrifyingVisage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTerrifyingVisage;
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.Threat += 15;
	}

});

