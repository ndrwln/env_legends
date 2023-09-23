this.perk_legend_horse_collection <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_horse_collection";
		this.m.Name = this.Const.Strings.PerkName.LegendHorseCollection;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHorseCollection;
		this.m.Icon = "ui/perks/rebound_circle.png";
		this.m.IconDisabled = "ui/perks/rebound_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local maxFat = actor.getFatigueMax();
		local currentFat = actor.getFatigue();
		local ratio = currentFat / maxFat;

		if (ratio > 0.9)
		{
			_properties.FatigueRecoveryRate += 5;
		}
	}

});

