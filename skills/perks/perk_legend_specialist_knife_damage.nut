this.perk_legend_specialist_knife_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_knife_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistKnifeDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistKnifeDamage;
		this.m.Icon = "ui/perks/knife_01.png";
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
			if (item.getID() == "weapon.knife" || item.getID() == "weapon.legend_shiv")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}

			if (item.isWeaponType(this.Const.Items.WeaponType.Dagger))
			{
				_properties.DamageRegularMin += 2;
				_properties.DamageRegularMax += 7;
			}
		}
	}

});

