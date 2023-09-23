this.perk_legend_night_raider <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_night_raider";
		this.m.Name = this.Const.Strings.PerkName.LegendNightRaider;
		this.m.Description = this.Const.Strings.PerkDescription.LegendNightRaider;
		this.m.Icon = "ui/perks/night_raider.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.getContainer().getActor().isPlayerControlled())
		{
			this.onCombatStarted();
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (this.getContainer().hasSkill("special.night") && _properties.IsAffectedByNight == true)
		{
			_properties.Threat += 10;
			_properties.Vision += 1;
			_properties.MeleeSkill *= 1.1;
			_properties.RangedSkill *= 1.1;
			!_properties.IsAffectedByNight;
		}
	}

});

