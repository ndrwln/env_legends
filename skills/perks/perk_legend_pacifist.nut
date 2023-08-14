this.perk_legend_pacifist <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_pacifist";
		this.m.Name = this.Const.Strings.PerkName.LegendPacifist;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPacifist;
		this.m.Icon = "ui/perks/pacifist_circle.png";
		this.m.IconDisabled = "ui/perks/pacifist_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
		_properties.BraveryMult *= 1.1;
	}

});

