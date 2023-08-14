this.perk_legend_net_casting <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_net_casting";
		this.m.Name = this.Const.Strings.PerkName.LegendNetCasting;
		this.m.Description = this.Const.Strings.PerkDescription.LegendNetCasting;
		this.m.Icon = "ui/perks/net_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInNetCasting = true;
	}

});

