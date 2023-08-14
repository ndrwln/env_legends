this.perk_legend_specialist_pitchfork_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_pitchfork_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistPitchforkSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistPitchforkSkill;
		this.m.Icon = "ui/perks/pitchfork_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local item = this.getContainer().getActor().getMainhandItem();

		if (item != null)
		{
			if (item.getID() == "weapon.pitchfork" || item.getID() == "weapon.legend_wooden_pitchfork" || item.getID() == "weapon.legend_hoe" || item.getID() == "weapon.legend_scythe" || item.getID() == "weapon.wooden_flail" || item.getID() == "weapon.warfork")
			{
				_properties.MeleeSkill += 12;
				_properties.DamageArmorMult += 0.25;
			}
			else if (item.isWeaponType(this.Const.Items.WeaponType.Polearm))
			{
				_properties.MeleeSkill += 3;
				_properties.DamageArmorMult += 0.08;
			}
		}
	}

});

