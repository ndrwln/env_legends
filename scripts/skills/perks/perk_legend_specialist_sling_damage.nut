this.perk_legend_specialist_sling_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_sling_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistSlingDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistSlingDamage;
		this.m.Icon = "ui/perks/sling_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local item = this.getContainer().getActor().getMainhandItem();

		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Sling))
		{
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 12;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.getID() == "actives.legend_slingstaff_bash")
		{
			_properties.DamageRegularMin -= 4;
			_properties.DamageRegularMax -= 12;
		}
	}

});

