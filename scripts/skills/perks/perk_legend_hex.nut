this.perk_legend_hex <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_hex";
		this.m.Name = this.Const.Strings.PerkName.LegendHex;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHex;
		this.m.Icon = "ui/perks/hex_circle.png";
		this.m.IconDisabled = "ui/perks/hex_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = true;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_hex"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_hex_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_hex");
	}

});

