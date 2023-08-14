this.legend_ancient_scroll_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.ancient_scroll";
		this.m.Name = "Ancient Scroll";
		this.m.Description = "A torn-up scroll with knowledge unseen for centuries. It can be translated by a character with the interpretation perk in the crafting tent. Highly valuable to some historians, although it is useless to many. They can, however, be studied with effort and a high chance of headache. Every brother may use up to 1 scroll. Being bright increases this to 2 scrolls, and being dumb decreases this to 0 scrolls.";
		this.m.Icon = "trade/scroll.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsUsable = true;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 50;
	}

	function getBuyPrice()
	{
		if (this.m.IsSold)
		{
			return this.getSellPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getPriceMult() * this.World.State.getCurrentTown().getBuyPriceMult() * this.Const.World.Assets.BaseBuyPrice));
		}

		return this.item.getBuyPrice();
	}

	function getSellPrice()
	{
		if (this.m.IsBought)
		{
			return this.getBuyPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.floor(this.getValue() * this.World.State.getCurrentTown().getSellPriceMult() * this.Const.World.Assets.BaseSellPrice);
		}

		return this.item.getSellPrice();
	}

	function onUse( _actor, _item = null )
	{
		local effect = _actor.getSkills().getSkillByID("effects.scroll");
		local smart = _actor.getSkills().getSkillByID("trait.bright");

		if (effect != null && (effect.m.Smart && smart != null || smart == null))
		{
			this.logInfo("Failed to apply scroll: " + (effect == null ? " effect null" : " effect not null"));
			return false;
		}
		else
		{
			local r = this.Math.rand(1, 5);

			switch(r)
			{
			case 1:
				local pT = _actor.getBackground().getPerkTree();
				local r;
				local r2;

				do
				{
					r = this.Math.rand(0, pT.len() - 1);
					r2 = this.Math.rand(0, pT[r].len() - 1);
				}
				while (_actor.getSkills().hasSkill(pT[r][r2].ID));

				_actor.getSkills().add(this.new(pT[r][r2].Script));
				break;

			case 2:
				if (_actor.getSkills().hasSkill("effects.trained"))
				{
					_actor.getSkills().removeByID("effects.trained");
				}

				local effect = this.new("scripts/skills/effects_world/new_trained_effect");
				effect.m.Description = "Trained effect (: +50% exp for 3 battles";
				effect.m.Duration = 3;
				effect.m.XPGainMult = 1.5;
				_actor.getSkills().add(effect);
				break;

			case 3:
				local newTree = false;
				local bigTree;

				while (newTree == false)
				{
					local r = this.Math.rand(1, 100);

					if (r <= 10)
					{
						bigTree = this.Const.Perks.MagicTrees;
					}
					else if (r <= 20)
					{
						bigTree = this.Const.Perks.EnemyTrees;
					}
					else if (r <= 30)
					{
						bigTree = this.Const.Perks.DefenseTrees;
					}
					else if (r <= 55)
					{
						bigTree = this.Const.Perks.ClassTrees;
					}
					else if (r <= 75)
					{
						bigTree = this.Const.Perks.TraitsTrees;
					}
					else if (r <= 100)
					{
						bigTree = this.Const.Perks.WeaponTrees;
					}

					local subGroup = bigTree.getRandom([]).Tree;

					foreach( index, arrAdd in subGroup )
					{
						foreach( perkAdd in arrAdd )
						{
							if (_actor.getBackground().addPerk(perkAdd, index))
							{
								newTree = true;
							}
						}
					}
				}

				break;

			case 4:
				_actor.m.LevelUps += 1;
				_actor.fillAttributeLevelUpValues(1, true);
				break;

			case 5:
				break;
			}

			local r = this.Math.rand(0, 4);

			if (r == 0)
			{
				if (!_actor.getSkills().hasSkill("effect.legend_headache"))
				{
					_actor.getSkills().add(this.new("scripts/skills/effects_world/legend_headache_effect"));
				}

				_actor.getSkills().add(this.new("scripts/skills/effects_world/legend_irritable_effect"));
			}
		}

		if (effect != null)
		{
			effect.m.Smart = true;
		}
		else
		{
			_actor.getSkills().add(this.new("scripts/skills/effects/legend_scroll_effect"));
		}

		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
		return true;
	}

});

