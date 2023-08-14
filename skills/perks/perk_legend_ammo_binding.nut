this.perk_legend_ammo_binding <- this.inherit("scripts/skills/skill", {
	m = {
		Ammo = 10
	},
	function create()
	{
		this.m.ID = "perk.legend_ammo_binding";
		this.m.Name = this.Const.Strings.PerkName.LegendAmmoBinding;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAmmoBinding;
		this.m.Icon = "ui/perks/MaxAmmoT1.png";
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
		_properties.RangedSkillMult *= 1.05;
	}

});

