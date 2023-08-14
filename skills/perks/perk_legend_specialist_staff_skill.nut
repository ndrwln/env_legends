this.perk_legend_specialist_staff_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_staff_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecStaffSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecStaffSkill;
		this.m.Icon = "ui/perks/spear_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item != null)
		{
			if (item.isWeaponType(this.Const.Items.WeaponType.Staff))
			{
				_properties.MeleeDefense += 16;
				_properties.RangedDefense += 16;

				if (item.isWeaponType(this.Const.Items.WeaponType.Sword) || item.isWeaponType(this.Const.Items.WeaponType.Sling) || item.isWeaponType(this.Const.Items.WeaponType.Musical))
				{
					_properties.MeleeDefense -= 8;
					_properties.RangedDefense -= 8;
				}
			}
			else if (item.isWeaponType(this.Const.Items.WeaponType.Musical))
			{
				_properties.MeleeDefense += 8;
				_properties.RangedDefense += 8;
			}
		}
	}

});

