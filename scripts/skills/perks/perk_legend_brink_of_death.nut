this.perk_legend_brink_of_death <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_brink_of_death";
		this.m.Name = this.Const.Strings.PerkName.LegendBrinkOfDeath;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBrinkOfDeath;
		this.m.Icon = "ui/perks/perk_bod.png";
		this.m.IconDisabled = "ui/perks/perk_bod_bw.png";
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
			if (!a.getSkills().hasSkill("trait.survivor"))
			{
				a.getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
			}
		}
	}

});

