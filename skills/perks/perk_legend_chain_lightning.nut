this.perk_legend_chain_lightning <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_chain_lightning";
		this.m.Name = this.Const.Strings.PerkName.LegendChainLightning;
		this.m.Description = this.Const.Strings.PerkDescription.LegendChainLightning;
		this.m.Icon = "ui/perks/lightning_circle.png";
		this.m.IconDisabled = "ui/perks/lightning_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_chain_lightning"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_chain_lightning"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_chain_lightning");
	}

});

