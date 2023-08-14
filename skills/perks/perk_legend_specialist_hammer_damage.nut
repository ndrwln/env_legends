this.perk_legend_specialist_hammer_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_hammer_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistHammerDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistHammerDamage;
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
			if (item.getID() == "weapon.legend_hammer" || item.getID() == "weapon.legend_named_blacksmith_hammer")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}

			if (item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer))
			{
				_properties.DamageRegularMin += 2;
				_properties.DamageRegularMax += 7;
			}
		}
	}

});

