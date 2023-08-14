this.perk_legend_med_packages <- this.inherit("scripts/skills/skill", {
	m = {
		Amount = 30
	},
	function create()
	{
		this.m.ID = "perk.legend_med_packages";
		this.m.Name = this.Const.Strings.PerkName.LegendMedPackages;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMedPackages;
		this.m.Icon = "ui/perks/MaxMedsT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getModifier()
	{
		return this.m.Amount;
	}

	function onAdded()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateMedsModifier();
	}

	function onRemoved()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateMedsModifier();
	}

	function onUpdate( _properties )
	{
		_properties.BraveryMult *= 1.05;
	}

});

