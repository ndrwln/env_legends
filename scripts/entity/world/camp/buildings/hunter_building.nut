this.hunter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Items = [],
		NumBros = 0,
		Points = 0,
		FoodAmount = 0,
		Craft = 0,
		Value = 0,
		rollCount = 0,
		Mode = 0,
		VerboseResults = {},
		HuntLevel = 0,
		CookLevel = 0,
		BrewLevel = 0,
		CurrentTarget = null,
		PreviousTarget = null,
		TargetStartTime = 0,
		AssignedBackgrounds = [],
		LootGenerator = null
	},
	function create()
	{
		this.camp_building.create();
		this.m.ID = this.Const.World.CampBuildings.Hunter;
		this.m.ModName = "Hunting";
		this.m.HasPopup = true;
		this.m.ModMod = 10.0;
		this.m.BaseCraft = 1.5;
		this.m.Slot = "hunt";
		this.m.Name = "Camp Kitchen";
		this.m.Description = "A kitchen tent with supplies for hunting, preparing and cooking food";
		this.m.BannerImage = "ui/buttons/banner_hunt.png";
		this.m.CanEnter = false;
		this.m.Sounds = [
			{
				File = "ambience/camp/camp_hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
			{
				File = "ambience/camp/camp_hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
	}

	function hasPopup()
	{
		return this.m.HasPopup && this.getUpgraded();
	}

	function getMode()
	{
		return this.m.Mode;
	}

	function setMode( _m )
	{
		if (typeof _m == "string")
		{
			this.m.Mode = this.Const.HuntingLoot.HunterCampMode[_m];
		}
		else
		{
			typeof _m;

			if ("integer")
			{
				this.m.Mode = _m;
			}
		}
	}

	function queryConfigureSettings()
	{
		local ret = {};
		ret.Buttons <- this.array(this.Const.HuntingLoot.HunterCampMode.len(), "");
		ret.CurrentMode <- this.m.Mode;

		foreach( mode, index in this.Const.HuntingLoot.HunterCampMode )
		{
			ret.Buttons[index] = mode;
		}

		return ret;
	}

	function onPopupButtonClicked( _data )
	{
		if (_data.len() != 2)
		{
			return;
		}

		local self = this;
		local mode = _data[0];
		local func = _data[1];
		self[func](mode);
		::Sound.play("sounds/move_pot_clay_01.wav", 2.0);
	}

	function getTitle()
	{
		if (this.getUpgraded())
		{
			return this.m.Name + " *Upgraded*";
		}

		return this.m.Name + " *Not Upgraded*";
	}

	function getDescription()
	{
		local desc = "";
		desc = desc + "Hunting parties can only be sent out while encamped. The more people assigned, the more food foraged or hunted. ";
		desc = desc + "Returns different food items depending on the current biome. Some items require the knowledge of specific backgrounds to be obtainable.";
		desc = desc + "\n\n";
		desc = desc + this.format("Assigning mercenaries with %s backgrounds increases the %s (based on each character\'s level), which allows the hunting party to hunt rarer or more dangerous prey.\n", ::Const.UI.getColorized("Expert Hunter", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("Hunt Tier", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("Assigning mercenaries with the %s perk gives a chance to yield %s of the obtained food items.\n", ::Const.UI.getColorized("Meal Preparation", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("improved versions", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("Assigning mercenaries with the %s perk gives a chance to yield %s. ", ::Const.UI.getColorized("Alcohol Brewing", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("wine and beer", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + "\n\n";
		desc = desc + "Upgrading this tent grants the following effects:\n";
		desc = desc + this.format("- Increases foraging / hunting speed by %s\n", ::Const.UI.getColorized("15%", ::Const.UI.Color.PositiveValue));
		desc = desc + this.format("- Unlock the %s button, allowing you to customize the priorities of the hunting party\n", ::Const.UI.getColorized("Hunting Mode", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + "- Increases the chance to obtain bonus loot, improved food items, and brewed items\n";
		desc = desc + this.format("- Assigning %s backgrounds increases the %s at a much greater rate\n", ::Const.UI.getColorized("Expert Hunter", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("Hunt Tier", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("- %s have a chance to obtain %s from hunting, such as trophies or crafting ingredients\n", ::Const.UI.getColorized("Expert Hunters", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("bonus loot", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("- Assigning %s slightly increases the chance to yield %s of obtained food items even without the Meal Preparation perk\n", ::Const.UI.getColorized("cooking backgrounds", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("improved versions", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("- Assigning %s slightly increases the chance to yield %s even without the Alcohol Brewing perk\n", ::Const.UI.getColorized("cooking backgrounds", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("brewed items", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("- %s can also produce %s\n", ::Const.UI.getColorized("Brewers", ::Const.UI.Color.getHighlightLightBackgroundValue()), ::Const.UI.getColorized("mead", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + this.format("- Advanced food can also be made using spices in the %s tent", ::Const.UI.getColorized("crafting", ::Const.UI.Color.getHighlightLightBackgroundValue()));
		desc = desc + "\n\n";
		desc = desc + ("Expert Hunter backgrounds: " + ::Const.LegendMod.Language.arrayToText(::Const.HuntingLoot.ExpertHunterBackgrounds.map(function ( bg )
		{
			return ::Const.HuntingLoot.RequiredBackgrounds[bg];
		}), "and", false) + "\n\n");
		desc = desc + "Cooking backgrounds: Miller / Baker, Butcher / Fishmonger, Servant, Cannibal";
		return desc;
	}

	function getModifierToolip()
	{
		local mod = this.getModifiers();
		local generator = ::Const.HuntingLoot.getGenerator(::World.State.getPlayer().getTile().Type, this.getUpgraded(), this.getHuntLevel(), this.getCookLevel(), this.getBrewLevel(), this.getAssignedBackgrounds(true));
		local targets = generator.getEligibleTargets();
		local difficulty = targets.map(function ( t )
		{
			return t.Difficulty;
		});
		local averageDifficulty = difficulty.reduce(function ( p, c )
		{
			return p + c;
		}) / difficulty.len();
		local estimateHuntTime = this.estimateHuntTime(averageDifficulty, mod.Craft);
		local ret = [
			{
				id = 5,
				type = "text",
				icon = "ui/buttons/asset_food_up.png",
				text = "Successful hunt will take approximately [color=" + this.Const.UI.Color.PositiveValue + "]" + ::Math.floor(estimateHuntTime) + "[/color] hours."
			}
		];
		local id = 6;

		foreach( bro in mod.Modifiers )
		{
			ret.push({
				id = id,
				type = "hint",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bro[0] / 100.0 * 100.0 + "%[/color] " + bro[1] + " (" + bro[2] + ")"
			});
			id = ++id;
		}

		return ret;
	}

	function isHidden()
	{
		if (::Legends.Mod.ModSettings.getSetting("SkipCamp").getValue())
		{
			return false;
		}

		return !this.World.Flags.get("HasLegendCampHunting");
	}

	function getUpgraded()
	{
		return this.Stash.hasItem("tent.hunter_tent");
	}

	function getLevel()
	{
		local pro = "dude";

		if (this.getUpgraded())
		{
			pro = "tent";
		}

		local sub = "empty";

		if (this.getAssignedBros() > 0)
		{
			sub = "full";
		}

		return pro + "_" + sub;
	}

	function init()
	{
		this.m.Items = [];
		this.m.Points = 0;
		this.m.FoodAmount = 0;
		local mod = this.getModifiers();
		this.m.NumBros = mod.Assigned;
		this.m.Craft = mod.Craft;
		this.m.VerboseResults = {
			Food = {
				Items = {}
			},
			Cook = {
				Assigned = [],
				Items = {}
			},
			Hunt = {
				Assigned = [],
				Items = {}
			},
			Brew = {
				Assigned = [],
				Items = {}
			}
		};
		this.m.HuntLevel = this.getHuntLevel(true);
		this.m.CookLevel = this.getCookLevel(true);
		this.m.BrewLevel = this.getBrewLevel(true);
		this.m.AssignedBackgrounds = this.getAssignedBackgrounds(true);
		this.m.CurrentTarget = null;
		this.m.PreviousTarget = null;
		this.m.TargetStartTime = 0;
		local biome = ::World.State.getPlayer().getTile().Type;
		this.m.LootGenerator = ::Const.HuntingLoot.getGenerator(biome, this.getUpgraded(), this.m.HuntLevel, this.m.CookLevel, this.m.BrewLevel, this.m.AssignedBackgrounds, this.m.Mode);
	}

	function getAssignedBackgrounds( _relevantOnly = false )
	{
		local ret = [];
		local roster = this.World.getPlayerRoster().getAll();

		foreach( c in roster )
		{
			if (c.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			local bg = c.getBackground().getID();

			if (_relevantOnly)
			{
				if (ret.find(bg) == null && ::Const.HuntingLoot.AllRequiredBackgrounds.All.find(bg) != null)
				{
					ret.push(bg);
				}
			}
			else if (ret.find(bg) == null)
			{
				ret.push(bg);
			}
		}

		return ret;
	}

	function getExpertHunters()
	{
		local ret = {};
		local roster = ::World.getPlayerRoster().getAll();

		foreach( c in roster )
		{
			if (c.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			if (c.getBackground().isBackgroundType(this.Const.BackgroundType.ExpertHunter) || c.getBackground().getID() in ::Const.HuntingLoot.ExpertHunterBackgrounds)
			{
				ret[c.getNameOnly()] <- c.getBackground().getNameOnly();
			}
		}

		return ret;
	}

	function getCooks()
	{
		local ret = {};
		local roster = ::World.getPlayerRoster().getAll();

		foreach( c in roster )
		{
			if (c.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			if (c.getBackground().getID() in ::Const.HuntingLoot.CookBackgrounds || c.getSkills().hasSkill("perk.legend_meal_preperation"))
			{
				ret[c.getNameOnly()] <- c.getBackground().getNameOnly();
			}
		}

		return ret;
	}

	function getBrewers()
	{
		local ret = {};
		local roster = ::World.getPlayerRoster().getAll();

		foreach( c in roster )
		{
			if (c.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			if (c.getBackground().getID() in ::Const.HuntingLoot.CookBackgrounds || c.getSkills().hasSkill("perk.legend_alcohol_brewing"))
			{
				ret[c.getNameOnly()] <- c.getBackground().getNameOnly();
			}
		}

		return ret;
	}

	function getHuntLevel( _updateVerboseResults = false )
	{
		local roster = this.World.getPlayerRoster().getAll();
		local huntLevel = 0;

		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.ExpertHunter) || bro.getBackground().getID() in ::Const.HuntingLoot.ExpertHunterBackgrounds)
			{
				if (_updateVerboseResults)
				{
					this.m.VerboseResults.Hunt.Assigned.push(bro.getNameOnly());
				}

				if (this.getUpgraded())
				{
					huntLevel = huntLevel + this.Math.ceil(bro.getLevel());
				}
				else
				{
					huntLevel = huntLevel + this.Math.ceil(bro.getLevel() * 0.1);
				}
			}
		}

		return huntLevel;
	}

	function getCookLevel( _updateVerboseResults = false )
	{
		local roster = this.World.getPlayerRoster().getAll();
		local cookLevel = 0;

		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			local added = false;

			if (this.getUpgraded())
			{
				if (bro.getBackground().getID() == "background.miller" || bro.getBackground().getID() == "background.butcher" || bro.getBackground().getID() == "background.servant" || bro.getBackground().getID() == "background.cannibal")
				{
					cookLevel = cookLevel + ::Math.floor(bro.getLevel() * 0.1);

					if (_updateVerboseResults)
					{
						this.m.VerboseResults.Cook.Assigned.push(bro.getNameOnly());
						added = true;
					}
				}
			}

			if (bro.getSkills().hasSkill("perk.legend_meal_preperation"))
			{
				cookLevel = cookLevel + bro.getLevel();

				if (_updateVerboseResults && !added)
				{
					this.m.VerboseResults.Cook.Assigned.push(bro.getNameOnly());
					added = true;
				}
			}
		}

		return cookLevel;
	}

	function getBrewLevel( _updateVerboseResults = false )
	{
		local roster = this.World.getPlayerRoster().getAll();
		local brewerLevel = 0;

		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			local added = false;

			if (this.getUpgraded())
			{
				if (bro.getBackground().getID() == "background.miller" || bro.getBackground().getID() == "background.butcher" || bro.getBackground().getID() == "background.servant" || bro.getBackground().getID() == "background.cannibal")
				{
					brewerLevel = brewerLevel + ::Math.floor(bro.getLevel() * 0.1);

					if (_updateVerboseResults)
					{
						this.m.VerboseResults.Brew.Assigned.push(bro.getNameOnly());
						added = true;
					}
				}
			}

			if (bro.getSkills().hasSkill("perk.legend_alcohol_brewing"))
			{
				brewerLevel = brewerLevel + bro.getLevel();

				if (_updateVerboseResults && !added)
				{
					this.m.VerboseResults.Brew.Assigned.push(bro.getNameOnly());
					added = true;
				}
			}
		}

		return brewerLevel;
	}

	function getResults()
	{
		if (this.m.Items.len() < 1)
		{
			return [];
		}

		local res = [];
		local categories = [
			"Food",
			"Hunt",
			"Cook",
			"Brew"
		];
		res.push({
			id = 81,
			text = "Your hunting party brought back " + this.m.FoodAmount + " Food with the following:",
			divider = "top"
		});

		foreach( item in this.m.VerboseResults.Food.Items )
		{
			res.push({
				id = 80,
				icon = item.Icon,
				text = item.Name + " x" + item.Count
			});
		}

		if (this.m.VerboseResults.Hunt.Items.len() > 0)
		{
			res.push({
				id = 79,
				text = ::Const.LegendMod.Language.arrayToText(this.m.VerboseResults.Hunt.Assigned, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + " had an exceptional hunt and brought back the following:"
			});

			foreach( item in this.m.VerboseResults.Hunt.Items )
			{
				res.push({
					id = 78,
					icon = item.Icon,
					text = item.Name + " x" + item.Count
				});
			}
		}

		if (this.m.VerboseResults.Cook.Items.len() > 0)
		{
			res.push({
				id = 77,
				text = ::Const.LegendMod.Language.arrayToText(this.m.VerboseResults.Cook.Assigned, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + " prepared the following in the camp kitchen:"
			});

			foreach( item in this.m.VerboseResults.Cook.Items )
			{
				res.push({
					id = 76,
					icon = item.Icon,
					text = item.Name + " x" + item.Count
				});
			}
		}

		if (this.m.VerboseResults.Brew.Items.len() > 0)
		{
			res.push({
				id = 75,
				text = ::Const.LegendMod.Language.arrayToText(this.m.VerboseResults.Brew.Assigned, "and", ::Const.UI.Color.getHighlightDarkBackgroundValue()) + " brewed the following:"
			});

			foreach( item in this.m.VerboseResults.Brew.Items )
			{
				res.push({
					id = 74,
					icon = item.Icon,
					text = item.Name + " x" + item.Count
				});
			}
		}

		res.push({
			id = 73,
			divider = "bottom"
		});
		return res;
	}

	function getAssignedBros()
	{
		local mod = this.getModifiers();
		return mod.Assigned;
	}

	function getInfo()
	{
		local ret = [];
		local mod = this.getModifiers();
		local bgs = this.getAssignedBackgrounds(true);
		local huntLevel = this.getHuntLevel(false);
		local expertHunters = this.getExpertHunters();
		local cooks = this.getCooks();
		local brewers = this.getBrewers();
		local indent = "<span style=\"display: inline-block; width: 1rem\"></span>";
		ret.push("Hunting points per hour: " + mod.Craft);
		ret.push("Hunt Tier: " + ::Const.HuntingLoot.getHuntLevelTier(huntLevel));
		ret.push("Current mode: <span style=\"color:" + ::Const.UI.Color.getHighlightLightBackgroundValue() + ";\">" + ::Const.HuntingLoot.HunterCampModeNameMap[this.m.Mode] + "</span>");
		ret.push("Current biome: <span style=\"color:" + ::Const.UI.Color.getHighlightLightBackgroundValue() + ";\">" + ::Const.World.TerrainLocation[::World.State.getPlayer().getTile().Type]) + "</span>";
		local targets = ::Const.HuntingLoot.getBiomeTargetDefs(::World.State.getPlayer().getTile().Type);
		local forageable = [];
		local huntable = [];

		foreach( target in targets )
		{
			local text = "- " + target.Name + " (around " + ::Math.floor(this.estimateHuntTime(target.Difficulty, mod.Craft)) + " hours)";

			if (target.Type == "Forage")
			{
				local failed = false;
				local requirements = [];

				if (("Backgrounds" in target) && !::Const.HuntingLoot.hasQualifiedBackground(target.Backgrounds, bgs))
				{
					failed = true;
					local bgNames = [];

					foreach( b in target.Backgrounds )
					{
						bgNames.push(::Const.HuntingLoot.RequiredBackgrounds[b]);
					}

					requirements.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + "; display: inline-block; padding-left: 2rem;\">Requires " + ::Const.LegendMod.Language.arrayToText(bgNames, "or", false) + "</span>");
				}

				if (failed)
				{
					text = "<s>" + text + "</s>";
					forageable.push(text);
					forageable.extend(requirements);
					continue;
				}

				forageable.push(text);
			}
			else if (target.Type == "Hunt")
			{
				local failed = false;
				local requirements = [];

				if (!::Const.HuntingLoot.hasSufficientHuntLevelForTier(target, huntLevel))
				{
					failed = true;
					requirements.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + "; padding-left: 2rem;\">Requires Hunt Tier " + target.Tier + "</span>");
				}

				if (("Backgrounds" in target) && !::Const.HuntingLoot.hasQualifiedBackground(target.Backgrounds, bgs))
				{
					failed = true;
					local bgNames = [];

					foreach( b in target.Backgrounds )
					{
						bgNames.push(::Const.HuntingLoot.RequiredBackgrounds[b]);
					}

					requirements.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + "; display: inline-block; padding-left: 2rem;\">Requires " + ::Const.LegendMod.Language.arrayToText(bgNames, "or", false) + "</span>");
				}

				if (failed)
				{
					text = "<s>" + text + "</s>";
					huntable.push(text);
					huntable.extend(requirements);
					continue;
				}

				huntable.push(text);
			}
		}

		ret.push("<u>Forageable</u>");
		ret.extend(forageable);
		ret.push("<u>Huntable</u>");
		ret.extend(huntable);

		if (expertHunters.len() > 0)
		{
			ret.push("<u>Expert Hunters</u>");

			foreach( name, bg in expertHunters )
			{
				ret.push("- " + name + " (" + bg + ")");
			}
		}
		else
		{
			ret.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + ";\"><u>No Expert Hunters</u></span>");
		}

		if (cooks.len() > 0)
		{
			ret.push("<u>Cooks</u>");

			foreach( name, bg in cooks )
			{
				ret.push("- " + name + " (" + bg + ")");
			}
		}
		else
		{
			ret.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + ";\"><u>No Cooks</u></span>");
		}

		if (brewers.len() > 0)
		{
			ret.push("<u>Brewers</u>");

			foreach( name, bg in brewers )
			{
				ret.push("- " + name + " (" + bg + ")");
			}
		}
		else
		{
			ret.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + ";\"><u>No Brewers</u></span>");
		}

		ret.push("<u>Hunting points contributions per hour</u>");
		return ret;
	}

	function getUpdateText()
	{
		if (this.m.NumBros == 0)
		{
			return null;
		}

		local text = [
			"Obtained ... " + this.m.FoodAmount + " food and gained " + this.m.Items.len() + " items"
		];

		if (this.Stash.getNumberOfEmptySlots() == 0)
		{
			return [
				text[0] + " (Inventory is full!)"
			];
		}

		local hours = ::Math.ceil((::Time.getVirtualTimeF() - this.m.TargetStartTime) / (this.World.getTime().SecondsPerDay / 24)) + 1;
		local plural = hours > 1 ? "s" : "";

		if (this.m.CurrentTarget)
		{
			if (this.m.CurrentTarget.Type == "Forage")
			{
				text.push("Foraging " + this.m.CurrentTarget.Text + " ... " + hours + " hour" + plural);
			}
			else
			{
				text.push("Hunting " + this.m.CurrentTarget.Text + " ... " + hours + " hour" + plural);
			}
		}
		else if (this.m.PreviousTarget)
		{
			if (this.m.PreviousTarget.Type == "Forage")
			{
				text.push("Foraged " + this.m.PreviousTarget.Text + "! ... " + hours + " hour" + plural);
			}
			else
			{
				text.push("Hunted " + this.m.PreviousTarget.Text + "! ... " + hours + " hour" + plural);
			}
		}

		return text;
	}

	function update()
	{
		if (this.m.NumBros == 0)
		{
			return this.getUpdateText();
		}

		this.m.Points += this.m.Craft;
		local emptySlots = ::Stash.getNumberOfEmptySlots();

		if (emptySlots == 0)
		{
			return this.getUpdateText();
		}

		local item;
		local lootGenerator = this.m.LootGenerator;
		item = lootGenerator.rollBrew();

		if (item)
		{
			item.randomizeAmount();

			if (::isKindOf(item, "legend_usable_food") || ::isKindOf(item, "food_item"))
			{
				this.m.FoodAmount += item.getAmount();
			}

			this.m.Items.push(item);
			::Stash.add(item);
			this.addItemToVerboseResults("Brew", item);
			emptySlots = --emptySlots;

			if (emptySlots == 0)
			{
				return this.getUpdateText();
			}
		}

		local target;

		if (this.m.CurrentTarget)
		{
			target = this.m.CurrentTarget;
		}
		else
		{
			target = lootGenerator.rollTarget();
			this.m.TargetStartTime = ::Time.getVirtualTimeF();
		}

		if (this.rollSuccessfulHunt(target.Difficulty, this.m.Points))
		{
			local food = target.Food;
			food.randomizeAmount();
			food.randomizeBestBefore();
			this.m.FoodAmount += food.getAmount();
			this.m.Items.push(food);
			::Stash.add(food);
			this.addItemToVerboseResults("Food", food);
			this.m.CurrentTarget = null;
			this.m.Points = 0;

			if (::World.State.m.EscortedEntity != null)
			{
				local biome = ::World.State.getPlayer().getTile().Type;
				this.m.LootGenerator = ::Const.HuntingLoot.getGenerator(biome, this.getUpgraded(), this.m.HuntLevel, this.m.CookLevel, this.m.BrewLevel, this.m.AssignedBackgrounds, this.m.Mode);
			}

			emptySlots = --emptySlots;

			if (emptySlots == 0)
			{
				return this.getUpdateText();
			}

			if (target.Cook)
			{
				local cook = target.Cook;
				cook.randomizeAmount();
				this.m.FoodAmount += cook.getAmount();
				this.m.Items.push(cook);
				::Stash.add(cook);
				this.addItemToVerboseResults("Cook", cook);
				emptySlots = --emptySlots;

				if (emptySlots == 0)
				{
					return this.getUpdateText();
				}
			}

			if (target.Loot)
			{
				local loot = target.Loot;
				this.m.Items.push(loot);
				::Stash.add(loot);
				this.addItemToVerboseResults("Hunt", loot);
				emptySlots = --emptySlots;

				if (emptySlots == 0)
				{
					return this.getUpdateText();
				}
			}

			this.m.PreviousTarget = target;
			return this.getUpdateText();
		}
		else
		{
			this.m.CurrentTarget = target;
			return this.getUpdateText();
		}

		return this.getUpdateText();
	}

	function rollSuccessfulHunt( _difficulty, _points )
	{
		return ::Math.rand(1, 100) < ::Math.ceil(100.0 * _points / _difficulty);
	}

	function estimateHuntTime( _difficulty, _points )
	{
		return 0.928 * ::Math.pow(2 * _difficulty / _points, 0.5);
	}

	function addItemToVerboseResults( _category, _item )
	{
		local id = _item.getID();
		local itemName = _item.getName();
		local icon = false;

		if (_item.getIcon() != "")
		{
			icon = "ui/items/" + _item.getIcon();
		}

		if (!(id in this.m.VerboseResults[_category].Items))
		{
			this.m.VerboseResults[_category].Items[id] <- {
				Name = itemName,
				Count = 1,
				Icon = icon
			};
		}
		else
		{
			this.m.VerboseResults[_category].Items[id].Count++;
		}
	}

	function onClicked( _campScreen )
	{
		_campScreen.showHunterDialog();
		this.camp_building.onClicked(_campScreen);
	}

	function onSerialize( _out )
	{
		this.camp_building.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.camp_building.onDeserialize(_in);
	}

});

