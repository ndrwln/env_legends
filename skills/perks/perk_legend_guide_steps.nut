this.perk_legend_guide_steps <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_guide_steps";
		this.m.Name = this.Const.Strings.PerkName.LegendGuideSteps;
		this.m.Description = this.Const.Strings.PerkDescription.LegendGuideSteps;
		this.m.Icon = "ui/perks/guided_steps_circle.png";
		this.m.IconDisabled = "ui/perks/guided_steps_circle_bw.png";
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
			if (!a.getSkills().hasSkill("perk.pathfinder"))
			{
				a.getSkills().add(this.new("scripts/skills/perks/perk_pathfinder"));
			}
		}
	}

});

