this.perk_legend_ammo_bundles <- this.inherit("scripts/skills/skill", {
	m = {
		Ammo = 20
	},
	function create()
	{
		this.m.ID = "perk.legend_ammo_bundles";
		this.m.Name = this.Const.Strings.PerkName.LegendAmmoBundles;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAmmoBundles;
		this.m.Icon = "ui/perks/MaxAmmoT2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getModifier()
	{
		return this.m.Ammo;
	}

	function onAdded()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateAmmoModifier();
	}

	function onRemoved()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateAmmoModifier();
	}

	function onUpdate( _properties )
	{
		_properties.RangedDefenseMult *= 1.05;
	}

});

