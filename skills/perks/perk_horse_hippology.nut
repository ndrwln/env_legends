this.perk_horse_hippology <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_hippology";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseHippology;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseHippology;
		this.m.Icon = "ui/perks/perk_06.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();

		if (actor.getHitpoints() == actor.getHitpointsMax())
		{
			actor.setHitpoints(this.Math.floor(actor.getHitpoints() * 1.25));
		}
	}

	function onUpdate( _properties )
	{
		_properties.HitpointsMult *= 1.25;
	}

});

