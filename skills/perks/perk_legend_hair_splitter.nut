this.perk_legend_hair_splitter <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_hair_splitter";
		this.m.Name = this.Const.Strings.PerkName.LegendHairSplitter;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHairSplitter;
		this.m.Icon = "ui/perks/hairsplit_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.HitChance[this.Const.BodyPart.Head] += 30;
	}

});

