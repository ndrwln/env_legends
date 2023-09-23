this.legends_nomad_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_nomad";
		this.m.Name = "Nomad Tribe";
		this.m.Description = "[p=c][img]gfx/ui/events/event_170.png[/img][/p][p]Displaced from your land, take control of 4 nomads and a conscript hunted in the desert. \n[color=#bcad8c]Hunted:[/color] Start in the desert away from civilisation. City States are hostile and will always decline in favour with you while Northern Nobles will have a cold relationship with you but will not decline. The more nomads in your party the stronger this effect will be.\n[color=#bcad8c]Nomadic:[/color] Vision radius is increased by 30% on the world map. Settlements may contain Nomads and Bladedancers displaced from their lands willing to fight for you.\n[color=#bcad8c]The Path of the Interloper:[/color] Nomads and Muladis gain the \'Wind Reader\' perk when recruited. Bladedancers gain the \'Dodge\' perk. Other Nomads are friendly to you.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 181;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(5);
		this.m.StartingBusinessReputation = -50;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 5; i = i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
			i = ++i;
		}

		local bros = roster.getAll();
		bros[0].setPlaceInFormation(2);
		bros[0].setVeteranPerks(2);
		bros[0].getSprite("socket").setBrush("bust_base_nomads");
		bros[0].getSkills().add(this.new("scripts/skills/traits/nomad_trait"));
		bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_wind_reader"));
		bros[0].setStartValuesEx([
			"nomad_background"
		]);
		bros[0].getBackground().m.RawDescription = "{%name% is someone who you have known since they were a child. They always had a keen eye but had more interest in shooting things point blank with their sling instead. Their discovery of maces and swords changed their world for the better.}";
		bros[1].setPlaceInFormation(3);
		bros[1].setVeteranPerks(2);
		bros[1].getSprite("socket").setBrush("bust_base_nomads");
		bros[1].getSkills().add(this.new("scripts/skills/traits/nomad_trait"));
		bros[1].getSkills().add(this.new("scripts/skills/perks/perk_legend_wind_reader"));
		bros[1].setStartValuesEx([
			"nomad_background"
		]);
		bros[1].getBackground().m.RawDescription = "{%name% came from another tribe that merged with yours not too long ago. Their family was butched in the night by \'skin men\' who could travel thirty paces in a blink of the eye. While many think them unsettled by what appears to be a raid, you can\'t help but notice how they always sleep closest to the fire every night.}";
		bros[2].setPlaceInFormation(4);
		bros[2].setVeteranPerks(2);
		bros[2].getSkills().add(this.new("scripts/skills/effects_world/exhausted_effect"));
		bros[2].setStartValuesEx([
			"legend_conscript_ranged_background"
		]);
		bros[2].getBackground().m.RawDescription = "{This outsider was close to death when you found them in the sands. While they lack the mindset and resolve you have come to expect from others, their training from the City States makes %them% a useful weapon to use against them.}";
		bros[3].setPlaceInFormation(11);
		bros[3].setVeteranPerks(2);
		bros[3].getSprite("socket").setBrush("bust_base_nomads");
		bros[3].getSkills().add(this.new("scripts/skills/traits/nomad_trait"));
		bros[3].getSkills().add(this.new("scripts/skills/perks/perk_legend_wind_reader"));
		bros[3].setStartValuesEx([
			"nomad_background",
			"nomad_ranged_background"
		]);
		bros[3].getBackground().m.RawDescription = "{You know little about %name%, they prefer to stay quiet and keep to themselves. However their loyalty to the tribe has never come into question.}";
		bros[4].setPlaceInFormation(12);
		bros[4].setVeteranPerks(2);
		bros[4].getSprite("socket").setBrush("bust_base_nomads");
		bros[4].getSkills().add(this.new("scripts/skills/traits/nomad_trait"));
		bros[4].getSkills().add(this.new("scripts/skills/perks/perk_legend_wind_reader"));
		bros[4].setStartValuesEx([
			"nomad_ranged_background"
		]);
		bros[4].getBackground().m.RawDescription = "{Be it rabbit, snake or hyena - little stands a chance against %name% who readily hits their target with all the same precision. The change to conscripts over wildlife came as a challenge at first until they realised they just needed to aim slightly lower than normal.}";
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_lamb_item"));
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine * 1.5;
		this.World.Assets.m.Ammo = this.World.Assets.m.Ammo * 3;
	}

	function onSpawnPlayer()
	{
		local spawnTile;
		local settlements = this.World.EntityManager.getSettlements();
		local nearestVillage;
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(5, this.Const.World.Settings.SizeX - 5);
			local y = this.Math.rand(5, this.Const.World.Settings.SizeY - 5);

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.IsOccupied)
				{
				}
				else if (tile.Type != this.Const.World.TerrainType.Desert)
				{
				}
				else
				{
					local next = true;

					foreach( s in settlements )
					{
						local d = s.getTile().getDistanceTo(tile);

						if (d > 6 && d < 15)
						{
							local path = this.World.getNavigator().findPath(tile, s.getTile(), navSettings, 0);

							if (!path.isEmpty())
							{
								next = false;
								nearestVillage = s;
								break;
							}
						}
					}

					if (next)
					{
					}
					else
					{
						spawnTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		local oriental = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalCityState);

		foreach( n in oriental )
		{
			n.addPlayerRelation(-100.0, "You are an outlaw to the City States");
		}

		local orientalbandits = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalBandits);

		foreach( n in orientalbandits )
		{
			n.addPlayerRelation(100.0, "You walk the same path, but should not be seeing this message");
		}

		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);

		foreach( n in nobles )
		{
			n.addPlayerRelation(-30.0, "You are considered an outlaw");
		}

		this.m.StaticRelationsToFaction[this.Const.FactionType.OrientalCityState] = true;
		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", spawnTile.Coords.X, spawnTile.Coords.Y);
		this.World.Assets.updateLook(117);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/gilded_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legends_nomad_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.starting_scenario.onInit();

		if (this.World.State.getPlayer() != null)
		{
			this.World.State.getPlayer().m.VisionRadius = 670;
		}

		this.updateFactionActionsDeck();
	}

	function onHiredByScenario( bro )
	{
		if (bro.getBackground().getID() == "background.nomad" || bro.getBackground().getID() == "background.muladi")
		{
			bro.improveMood(1.5, "I walk with those on the path of the Interloper");
			bro.getSkills().add(this.new("scripts/skills/traits/nomad_trait"));
			bro.getSprite("socket").setBrush("bust_base_nomads");
			bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_wind_reader"));
		}
		else if (bro.getBackground().getID() == "background.bladedancer")
		{
			bro.improveMood(1.5, "I walk with those on the path of the Interloper");
			bro.getSkills().add(this.new("scripts/skills/traits/nomad_trait"));
			bro.getSprite("socket").setBrush("bust_base_nomads");
			bro.getSkills().add(this.new("scripts/skills/perks/perk_dodge"));
		}
		else
		{
			bro.worsenMood(2.0, "Nomadic life isn\'t for me...");
		}
	}

	function onGenerateBro( bro )
	{
	}

	function onUpdateHiringRoster( _roster, _settlement )
	{
		if (::MSU.isKindOf(_settlement, "city_state"))
		{
			this.addBroToRoster(_roster, "nomad_background", 3);
			this.addBroToRoster(_roster, "nomad_ranged_background", 3);
			this.addBroToRoster(_roster, "legend_bladedancer_background", 4);
		}
		else if (::MSU.isKindOf(_settlement, "legends_steppe_fort") || _settlement.isMilitary() && this.isSteppeSettlement(_settlement))
		{
			this.addBroToRoster(_roster, "nomad_background", 3);
			this.addBroToRoster(_roster, "nomad_ranged_background", 3);
			this.addBroToRoster(_roster, "legend_bladedancer_background", 4);
		}
		else if (::MSU.isKindOf(_settlement, "legends_steppe_village") || this.isSteppeSettlement(_settlement))
		{
			this.addBroToRoster(_roster, "nomad_background", 4);
			this.addBroToRoster(_roster, "nomad_ranged_background", 4);
			this.addBroToRoster(_roster, "legend_bladedancer_background", 8);
		}
	}

	function updateFactionActionsDeck()
	{
		local cityStates = ::World.FactionManager.getFactionsOfType(::Const.FactionType.OrientalCityState);

		foreach( faction in cityStates )
		{
			faction.removeActionByID("drive_away_nomads_action");
		}
	}

	function isSteppeSettlement( _settlement )
	{
		local settlementTile = _settlement.getTile();

		for( local i = 0; i != 6; i = i )
		{
			if (!settlementTile.hasNextTile(i))
			{
				return false;
			}
			else
			{
				local tile = settlementTile.getNextTile(i);

				if (tile.Type == this.Const.World.TerrainType.Steppe || tile.Type == this.Const.World.TerrainType.Desert || tile.Type == this.Const.World.TerrainType.Oasis)
				{
					return true;
				}
			}

			i = ++i;
		}

		return false;
	}

});

