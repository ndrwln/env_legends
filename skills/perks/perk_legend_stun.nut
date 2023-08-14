this.perk_legend_stun <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_stun";
		this.m.Name = this.Const.Strings.PerkName.LegendStunned;
		this.m.Description = this.Const.Strings.PerkDescription.LegendStunned;
		this.m.Icon = "skills/stun56.png";
		this.m.IconDisabled = "ui/perks/stun56_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_stun"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_stunned"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_stun");
	}

});

