this.perk_legend_specialist_butcher_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_butcher_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistButcherDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistButcherDamage;
		this.m.Icon = "ui/perks/cleaver_02.png";
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
			if (item.getID() == "weapon.butchers_cleaver" || item.getID() == "weapon.legend_named_butchers_cleaver")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}
			else if (item.isWeaponType(this.Const.Items.WeaponType.Cleaver) && !item.isWeaponType(this.Const.Items.WeaponType.Whip) && item.isItemType(this.Const.Items.ItemType.OneHanded))
			{
				_properties.DamageRegularMin += 2;
				_properties.DamageRegularMax += 7;
			}
		}
	}

});

