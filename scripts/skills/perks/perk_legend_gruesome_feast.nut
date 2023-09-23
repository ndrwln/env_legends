this.perk_legend_gruesome_feast <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_gruesome_feast";
		this.m.Name = this.Const.Strings.PerkName.LegendGruesomeFeast;
		this.m.Description = this.Const.Strings.PerkDescription.LegendGruesomeFeast;
		this.m.Icon = "ui/perks/gruesome_circle.png";
		this.m.IconDisabled = "ui/perks/gruesome_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_gruesome_feast"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_gruesome_feast"));
		}
	}

	function onRemoved()
	{
		if (!this.m.Container.hasSkill("perk.legend_item_gruesome_feast"))
		{
			this.m.Container.removeByID("actives.legend_gruesome_feast");
		}
	}

});

