this.perk_legend_specialist_spearwall <- this.inherit("scripts/skills/skill", {
	m = {
		Skills = [
			"actives.legend_staffwall",
			"actives.spearwall"
		]
	},
	function create()
	{
		this.m.ID = "perk.legend_specialist_spearwall";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecSpearWall;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecSpearWall;
		this.m.Icon = "ui/perks/spearwall_mastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAfterUpdate( _properties )
	{
		foreach( skill in this.getContainer().getSkillsByFunction(function ( _skill )
		{
			return this.m.Skills.find(_skill.getID()) != null;
		}.bindenv(this)) )
		{
			skill.m.FatigueCostMult *= 0.5;
			skill.m.ActionPointCost = 3;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.getContainer().hasSkill("effects.spearwall") && (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID()))
		{
			_properties.DamageTotalMult *= 1.25;
		}
	}

});

