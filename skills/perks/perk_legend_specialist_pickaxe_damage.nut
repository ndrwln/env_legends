this.perk_legend_specialist_pickaxe_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_pickaxe_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistPickaxeDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistPickaxeDamage;
		this.m.Icon = "ui/perks/pickaxe_01.png";
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
			if (item.getID() == "weapon.pickaxe")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}

			if (item.isWeaponType(this.Const.Items.WeaponType.Hammer) && item.isItemType(this.Const.Items.ItemType.TwoHanded))
			{
				_properties.DamageRegularMin += 2;
				_properties.DamageRegularMax += 7;
			}
		}
	}

});

