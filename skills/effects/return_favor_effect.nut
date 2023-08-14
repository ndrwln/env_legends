this.return_favor_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.return_favor";
		this.m.Name = "Return Favor";
		this.m.Description = "This character has assumed a defensive stance seeking to incapacitate anyone attacking.";
		this.m.Icon = "ui/perks/perk_31.png";
		this.m.IconMini = "perk_31_mini";
		this.m.Overlay = "perk_31";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]75%[/color] chance to stun and stagger any opponent missing with a melee attack (resistances and immunities still apply)."
			}
		];
	}

	function onMissed( _attacker, _skill )
	{
		local user = this.getContainer().getActor();

		if (!_skill.isRanged())
		{
			if (this.Math.rand(1, 100) <= 75 && !_attacker.getCurrentProperties().IsImmuneToStun && !_attacker.getSkills().hasSkill("effects.stunned"))
			{
				local d = _attacker.getTile().getDistanceTo(user.getTile());
				local item = user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

				if (d <= 1 || item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && d <= item.getRangeMax())
				{
					local stunned_effect = this.new("scripts/skills/effects/stunned_effect");
					local staggered_effect = this.new("scripts/skills/effects/staggered_effect");
					stunned_effect.addTurns(1);
					_attacker.getSkills().add(stunned_effect);
					_attacker.getSkills().add(staggered_effect);

					if (!user.isHiddenToPlayer() && !_attacker.isHiddenToPlayer())
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " has stunned and staggered " + this.Const.UI.getColorizedEntityName(_attacker) + " for one turn");
					}
				}
			}
		}
	}

	function onTurnStart()
	{
		this.removeSelf();
	}

});

