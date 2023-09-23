this.perk_legend_become_berserker <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_become_berserker";
		this.m.Name = this.Const.Strings.PerkName.LegendBecomeBerserker;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBecomeBerserker;
		this.m.Icon = "ui/backgrounds/ranger_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		local originalbackground = actor.getBackground().getID();
		local newbackground = this.new("scripts/skills/backgrounds/legend_berserker_background");
		actor.getSkills().removeByID(originalbackground);
		actor.getSkills().add(newbackground);
	}

});

