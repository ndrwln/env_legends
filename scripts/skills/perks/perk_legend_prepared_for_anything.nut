this.perk_legend_prepared_for_anything <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_prepared_for_anything";
		this.m.Name = this.Const.Strings.PerkName.LegendPreparedForAnything;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPreparedForAnything;
		this.m.Icon = "ui/perks/perk_20.png";
		this.m.IconDisabled = "ui/perks/perk_20_sw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		local actors = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

		foreach( a in actors )
		{
			if (!a.getSkills().hasSkill("perk.bags_and_belts"))
			{
				a.getSkills().add(this.new("scripts/skills/perks/perk_bags_and_belts"));
			}
		}
	}

});

