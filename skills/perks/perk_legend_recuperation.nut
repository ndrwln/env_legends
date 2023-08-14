this.perk_legend_recuperation <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_recuperation";
		this.m.Name = this.Const.Strings.PerkName.LegendRecuperation;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRecuperation;
		this.m.Icon = "ui/perks/recuperation_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTurnEnd()
	{
		local actor = this.getContainer().getActor();
		actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 2));
	}

	function onUpdate( _properties )
	{
		_properties.FatigueRecoveryRate += 2;
	}

});

