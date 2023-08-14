this.perk_legend_scholar <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_scholar";
		this.m.Name = this.Const.Strings.PerkName.LegendScholar;
		this.m.Description = this.Const.Strings.PerkDescription.LegendScholar;
		this.m.Icon = "ui/perks/scholar_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isDroppedAsLoot( _item )
	{
		return this.Math.rand(1, 100) <= 10;
	}

});

