this.perk_legend_zombie_bite <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.perk_legend_zombie_bite";
		this.m.Name = this.Const.Strings.PerkName.LegendZombieBite;
		this.m.Description = this.Const.Strings.PerkDescription.LegendZombieBite;
		this.m.Icon = "ui/perks/missile_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.zombie_bite"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/zombie_bite"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.zombie_bite");
	}

});

