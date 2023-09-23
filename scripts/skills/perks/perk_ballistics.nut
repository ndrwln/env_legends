this.perk_ballistics <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ballistics";
		this.m.Name = this.Const.Strings.PerkName.Ballistics;
		this.m.Description = this.Const.Strings.PerkDescription.Ballistics;
		this.m.Icon = "ui/perks/ballistics56_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.HitChanceAdditionalWithEachTile += 2;
	}

});

