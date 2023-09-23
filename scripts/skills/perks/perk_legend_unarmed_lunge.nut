this.perk_legend_unarmed_lunge <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_unarmed_lunge";
		this.m.Name = this.Const.Strings.PerkName.LegendUnarmedLunge;
		this.m.Description = this.Const.Strings.PerkDescription.LegendUnarmedLunge;
		this.m.Icon = "ui/perks/perk_sprint.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.getContainer().add(this.new("scripts/skills/actives/legend_unarmed_lunge_skill"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.legend_unarmed_lunge");
	}

});

