this.perk_ironside <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ironside";
		this.m.Name = this.Const.Strings.PerkName.Ironside;
		this.m.Description = this.Const.Strings.PerkDescription.Ironside;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getDescription()
	{
		local bonus = this.getBonus() * 100;
		return "This character gains [color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] damage reduction because of adjacent opponents.";
	}

	function isOpponent( _actor, _tag )
	{
		if (this.Math.abs(_actor.getTile().Level - _tag.Actor.getTile().Level) > 1)
		{
			return;
		}

		if (!_actor.isAlliedWith)
		{
			++_tag.Opponents;
		}
	}

	function getBonus()
	{
		this.result <- {
			Opponents = 0,
			Actor = this.m.Container.getActor()
		};
		this.Tactical.queryActorsInRange(this.getContainer().getActor().getTile(), 0, 1, this.isOpponent, this.result);
		return this.result.Opponents * 0.05;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.getBonus() == 0;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		_properties.DamageReceivedTotalMult -= this.getBonus();
	}

});

