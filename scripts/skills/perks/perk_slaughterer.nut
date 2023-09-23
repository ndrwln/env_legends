this.perk_slaughterer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.slaughterer";
		this.m.Name = this.Const.Strings.PerkName.Slaughterer;
		this.m.Description = this.Const.Strings.PerkDescription.Slaughterer;
		this.m.Icon = "skills/slaughterer.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		_properties.FatalityChanceMult = 100.0;
		_properties.FlatOnKillOtherActorModifier -= 5;
	}

});

