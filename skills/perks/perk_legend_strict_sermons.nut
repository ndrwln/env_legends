this.perk_legend_strict_sermons <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_strict_sermons";
		this.m.Name = this.Const.Strings.PerkName.LegendStrictSermons;
		this.m.Description = this.Const.Strings.PerkDescription.LegendStrictSermons;
		this.m.Icon = "ui/perks/perk_08.png";
		this.m.IconDisabled = "ui/perks/perk_08_bw.png";
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
			if (!a.getSkills().hasSkill("perk.fortified_mind"))
			{
				a.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
			}
		}
	}

});

