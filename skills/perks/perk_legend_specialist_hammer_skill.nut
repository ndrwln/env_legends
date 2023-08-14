this.perk_legend_specialist_hammer_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_hammer_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistHammerSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistHammerSkill;
		this.m.Icon = "ui/perks/pickaxe_02.png";
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
				_properties.MeleeSkill += 12;
				_properties.DamageArmorMult += 0.4;
			}

			if (item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer))
			{
				_properties.MeleeSkill += 3;
				_properties.DamageArmorMult += 0.1;
			}
		}
	}

});

