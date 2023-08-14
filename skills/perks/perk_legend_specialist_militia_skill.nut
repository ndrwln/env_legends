this.perk_legend_specialist_militia_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_militia_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistMilitiaSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistMilitiaSkill;
		this.m.Icon = "ui/perks/spear_02.png";
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
			if (item.getID() == "weapon.militia_spear" || item.getID() == "weapon.legend_wooden_spear" || item.getID() == "weapon.ancient_spear")
			{
				_properties.MeleeSkill += 12;
			}
			else if (item.isWeaponType(this.Const.Items.WeaponType.Spear))
			{
				_properties.MeleeSkill += 3;
			}
		}
	}

});

