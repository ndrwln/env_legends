this.perk_legend_mastery_staff_stun <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mastery_staff_stun";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecStaffStun;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecStaffStun;
		this.m.Icon = "ui/perks/staffmastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInStaffStun = true;
	}

});

