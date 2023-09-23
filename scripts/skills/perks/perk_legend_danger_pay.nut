this.perk_legend_danger_pay <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_danger_pay";
		this.m.Name = this.Const.Strings.PerkName.LegendDangerPay;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDangerPay;
		this.m.Icon = "ui/perks/coins_circle.png";
		this.m.IconDisabled = "ui/perks/coins_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_danger_pay"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_danger_pay"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_danger_pay");
	}

});

