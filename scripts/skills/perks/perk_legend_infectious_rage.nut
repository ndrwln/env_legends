this.perk_legend_infectious_rage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_infectious_rage";
		this.m.Name = this.Const.Strings.PerkName.LegendInfectiousRage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendInfectiousRage;
		this.m.Icon = "ui/perks/perk_35.png";
		this.m.IconDisabled = "ui/perks/perk_35_bw.png";
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
			if (!a.getSkills().hasSkill("perk.berserk"))
			{
				a.getSkills().add(this.new("scripts/skills/perks/perk_berserk"));
			}
		}
	}

});

