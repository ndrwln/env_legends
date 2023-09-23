this.relationship_check <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.relationship_check";
		this.m.Name = "Relationship Check";
		this.m.Icon = "skills/status_effect_01.png";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Trait + 600;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
		this.m.IsStacking = true;
	}

	function relationStringHelper( _name, _relTab )
	{
		local relNum = _relTab.RelationNum;
		local returnString = "";
		returnString = returnString + (_name + " relation gives: ");

		if (relNum <= -10)
		{
			returnString = returnString + "-5 Resolve";
		}

		if (relNum <= -20)
		{
			returnString = returnString + ", -5 Ranged Defense";
		}

		if (relNum <= -30)
		{
			returnString = returnString + ", -5 Melee Defense";
		}

		if (relNum > -10 && relNum <= 10)
		{
			returnString = returnString + "No Bonuses";
		}

		if (relNum > 10)
		{
			returnString = returnString + "+5 Resolve";
		}

		if (relNum > 20)
		{
			returnString = returnString + ", +5 Ranged Defense";
		}

		if (relNum > 30)
		{
			returnString = returnString + ", +5 Melee Defense";
		}

		returnString = returnString + ".\n";
		return returnString;
	}

	function getCombatTooltip()
	{
		local actor = this.getContainer().getActor();
		local targetTile = actor.getTile();
		local returnString = "";

		for( local i = 0; i != 6; i = ++i )
		{
			if (!targetTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = targetTile.getNextTile(i);

				if (tile.IsOccupiedByActor && tile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing)
				{
					if (tile.getEntity().getFaction() == this.Const.Faction.Player)
					{
						if (tile.getEntity().getCompanyID() == -1)
						{
						}
						else if (actor.getCompanyID() == -1)
						{
						}
						else
						{
							local relB = this.World.State.getRefFromID(actor.getCompanyID());

							if (relB == null)
							{
							}
							else
							{
								local relTab = relB.getActiveRelationshipWith(tile.getEntity());

								if (relTab == null)
								{
								}
								else
								{
									returnString = returnString + this.relationStringHelper(tile.getEntity().getName(), relTab);
								}
							}
						}
					}
				}
			}
		}

		if (returnString == "")
		{
			returnString = "No Bonuses";
		}

		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = returnString
			}
		];
	}

	function checkPosition( _roster, _actor, _position )
	{
		foreach( bro in _roster )
		{
			if (bro.getPlaceInFormation() == _position)
			{
				if (bro.getCompanyID() == -1)
				{
					return "";
				}

				local relB = this.World.State.getRefFromID(bro.getCompanyID());

				if (relB == null)
				{
					return "";
				}

				local relTab = relB.getActiveRelationshipWith(this.tile.getEntity());

				if (relTab == null)
				{
					return "";
				}

				return this.relationStringHelper(bro.getName(), relTab);
			}
		}

		return "";
	}

	function getNormalTooltip()
	{
		local actor = this.getContainer().getActor();
		local position = actor.getPlaceInFormation();
		local roster = this.World.getPlayerRoster().getAll();
		local returnString = "";

		if (position <= 8)
		{
			if (position != 0)
			{
				returnString = returnString + this.checkPosition(roster, actor, position - 1);
			}

			if (position != 8)
			{
				returnString = returnString + this.checkPosition(roster, actor, position + 1);
			}

			returnString = returnString + this.checkPosition(roster, actor, position + 9);
		}
		else if (position <= 17)
		{
			if (position != 9)
			{
				returnString = returnString + this.checkPosition(roster, actor, position - 1);
			}

			if (position != 17)
			{
				returnString = returnString + this.checkPosition(roster, actor, position + 1);
			}

			returnString = returnString + this.checkPosition(roster, actor, position - 9);
			returnString = returnString + this.checkPosition(roster, actor, position + 9);
		}
		else
		{
			if (position != 18)
			{
				returnString = returnString + this.checkPosition(roster, actor, position - 1);
			}

			if (position != 26)
			{
				returnString = returnString + this.checkPosition(roster, actor, position + 1);
			}

			returnString = returnString + this.checkPosition(roster, actor, position - 9);
		}

		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = returnString
			}
		];
	}

	function getTooltip()
	{
		if (("State" in this.Tactical) && this.Tactical.State != null)
		{
			return this.getCombatTooltip();
		}
		else
		{
			return this.getNormalTooltip();
		}
	}

});

