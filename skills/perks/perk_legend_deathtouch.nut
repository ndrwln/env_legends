this.perk_legend_deathtouch <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_deathtouch";
		this.m.Name = this.Const.Strings.PerkName.LegendDeathtouch;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDeathtouch;
		this.m.Icon = "ui/perks/deathtouch_circle.png";
		this.m.IconDisabled = "ui/perks/deathtouch_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_deathtouch"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_deathtouch"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_deathtouch");
	}

});

