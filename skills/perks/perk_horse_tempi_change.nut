this.perk_horse_tempi_change <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_tempi_change";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseTempiChange;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseTempiChange;
		this.m.Icon = "ui/perks/perk_08.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.RangedDefenseMult *= 1.25;
	}

});

