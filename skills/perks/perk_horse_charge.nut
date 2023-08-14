this.perk_horse_charge <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.perk_horse_charge";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseCharge;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseCharge;
		this.m.Icon = "ui/perks/charge_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_horse_charge"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_horse_charge"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_horse_charge");
	}

	function onUpdated( _properties )
	{
		_properties.TargetAttractionMult *= 1.33;
	}

});

