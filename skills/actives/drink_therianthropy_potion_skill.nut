this.drink_therianthropy_potion_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.drink_therianthropy_potion";
		this.m.Name = "Drink or Give Therianthropic Potion";
		this.m.Description = "Give to an adjacent ally or drink yourself a horrible concoction of poison taken from the bodies of beasts to destroys your own humanity. Can not be used while engaged in melee, and anyone receiving the item needs to have a free bag slot.";
		this.m.Icon = "skills/active_143.png";
		this.m.IconDisabled = "skills/active_143_sw.png";
		this.m.Overlay = "active_143";
		this.m.SoundOnUse = [
			"sounds/combat/drink_01.wav",
			"sounds/combat/drink_02.wav",
			"sounds/combat/drink_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 5;
		this.m.MinRange = 0;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = [
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Will inflict a permanent therianthropic injury on the drinker, allowing them to transform into a beast"
			}
		];

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function getCursorForTile( _tile )
	{
		if (_tile.ID == this.getContainer().getActor().getTile().ID)
		{
			return this.Const.UI.Cursor.Drink;
		}
		else
		{
			return this.Const.UI.Cursor.Give;
		}
	}

	function isUsable()
	{
		return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (target.getID() != _originTile.getEntity().getID() && !target.getItems().hasEmptySlot(this.Const.ItemSlot.Bag))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local user = _targetTile.getEntity();

		if (_user.getID() == user.getID())
		{
			user.TherianthropeInfectionRandom();

			if (!user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " drinks Therianthropic potion");
			}

			if (this.m.Item != null && !this.m.Item.isNull())
			{
				this.m.Item.removeSelf();
			}

			this.Const.Tactical.Common.checkDrugEffect(user);
		}
		else
		{
			if (!_user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " gives Therianthropic Potion to " + this.Const.UI.getColorizedEntityName(user));
			}

			this.spawnIcon("status_effect_92", _targetTile);
			this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
			local item = this.m.Item.get();
			_user.getItems().removeFromBag(item);
			user.getItems().addToBag(item);
		}

		return true;
	}

});

