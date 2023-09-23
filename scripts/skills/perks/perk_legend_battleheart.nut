this.perk_legend_battleheart <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_battleheart";
		this.m.Name = this.Const.Strings.PerkName.LegendBattleheart;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBattleheart;
		this.m.Icon = "ui/perks/battleheart_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsImmuneToSurrounding = true;
	}

});

