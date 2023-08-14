this.perk_legend_incoming <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_incoming";
		this.m.Name = this.Const.Strings.PerkName.LegendIncoming;
		this.m.Description = this.Const.Strings.PerkDescription.LegendIncoming;
		this.m.Icon = "ui/perks/incoming_circle.png";
		this.m.IconDisabled = "ui/perks/incoming_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_incoming"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_incoming"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_incoming");
	}

});

