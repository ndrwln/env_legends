this.perk_legend_teacher <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_teacher";
		this.m.Name = this.Const.Strings.PerkName.LegendTeacher;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTeacher;
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.IconDisabled = "ui/perks/perk_21_bw.png";
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
			if (!a.getSkills().hasSkill("perk.student"))
			{
				a.getSkills().add(this.new("scripts/skills/perks/perk_student"));
			}
		}
	}

});

