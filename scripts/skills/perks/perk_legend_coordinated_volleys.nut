this.perk_legend_coordinated_volleys <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_coordinated_volleys";
		this.m.Name = this.Const.Strings.PerkName.LegendCoordinatedVolleys;
		this.m.Description = this.Const.Strings.PerkDescription.LegendCoordinatedVolleys;
		this.m.Icon = "ui/perks/coordinated_volleys_circle.png";
		this.m.IconDisabled = "ui/perks/coordinated_volleys_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_coordinated_volleys"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_coordinated_volleys"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_coordinated_volleys");
	}

});

