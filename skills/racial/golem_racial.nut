this.golem_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.golem";
		this.m.Name = "";
		this.m.Icon = "";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.Racial;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function addStack()
	{
		local actor = this.getContainer().getActor();
		actor.grow();
		actor.checkMorale(1, 20);
	}

	function onUpdate( _properties )
	{
		local size = this.getContainer().getActor().getSize();

		if (size == 2)
		{
			_properties.Hitpoints += 110;
			_properties.MeleeSkill += 10;
			_properties.RangedSkill += 10;
			_properties.MeleeDefense += 5;
			_properties.RangedDefense -= 5;
			_properties.Initiative -= 10;
			_properties.ArmorMult[0] *= 2.0;
			_properties.ArmorMult[1] *= 2.0;
		}
		else if (size == 3)
		{
			_properties.Hitpoints += 330;
			_properties.MeleeSkill += 15;
			_properties.RangedSkill += 20;
			_properties.MeleeDefense += 10;
			_properties.RangedDefense -= 10;
			_properties.Initiative -= 20;
			_properties.ArmorMult[0] *= 4.0;
			_properties.ArmorMult[1] *= 4.0;
		}

		_properties.DamageRegularMin += 35 * size;
		_properties.DamageRegularMax += 45 * size;
		_properties.DamageArmorMult *= 0.6 + 0.05 * (size - 1);
		local actor = this.getContainer().getActor();

		if (actor.getSize() < 3)
		{
			local myTile = actor.getTile();
			local currentCount = 0;

			for( local j = 0; j < 6; j = j )
			{
				if (!myTile.hasNextTile(j))
				{
				}
				else if (myTile.getNextTile(j).IsOccupiedByActor && myTile.getNextTile(j).getEntity().getType() == this.Const.EntityType.SandGolem && myTile.getNextTile(j).getEntity().getSize() == actor.getSize())
				{
					currentCount = ++currentCount;
					currentCount = currentCount;
				}

				j = ++j;
			}

			if (currentCount >= 2)
			{
				_properties.InitiativeForTurnOrderAdditional += 10;
			}
			else if (currentCount == 1)
			{
				_properties.InitiativeForTurnOrderAdditional += 5;
			}
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill != null && _skill.getID() == "actives.throw_golem")
		{
			_properties.DamageReceivedTotalMult = 0.0;
			return;
		}

		switch(_hitInfo.DamageType)
		{
		case this.Const.Damage.DamageType.Piercing:
			if (_skill == null)
			{
				_properties.DamageReceivedRegularMult *= 0.2;
			}
			else if (_skill.isRanged())
			{
				local weapon = _skill.getItem();

				if (weapon != null && weapon.isItemType(this.Const.Items.ItemType.Weapon))
				{
					if (weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
					{
						_properties.DamageReceivedRegularMult *= 0.1;
					}
					else if (weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow))
					{
						_properties.DamageReceivedRegularMult *= 0.33;
					}
					else if (weapon.isWeaponType(this.Const.Items.WeaponType.Throwing) || weapon.isWeaponType(this.Const.Items.WeaponType.Firearm))
					{
						_properties.DamageReceivedRegularMult *= 0.25;
					}
					else
					{
						_properties.DamageReceivedRegularMult *= 0.2;
					}
				}
				else
				{
					_properties.DamageReceivedRegularMult *= 0.1;
				}
			}
			else
			{
				_properties.DamageReceivedRegularMult *= 0.5;
			}

			break;

		case this.Const.Damage.DamageType.Burning:
			_properties.DamageReceivedRegularMult *= 0.1;
			break;
		}
	}

});

