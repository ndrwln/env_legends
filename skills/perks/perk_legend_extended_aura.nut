this.perk_legend_extended_aura <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_extended_aura";
		this.m.Name = this.Const.Strings.PerkName.LegendExtendendAura;
		this.m.Description = this.Const.Strings.PerkDescription.LegendExtendendAura;
		this.m.Icon = "ui/perks/possess56.png";
		this.m.IconDisabled = "ui/perks/possess56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInSummons = true;
	}

});

