this.character_background <- this.inherit("scripts/skills/skill", {
	m = {
		HiringCost = 0,
		DailyCost = 0,
		DailyCostMult = 1.0,
		Excluded = [],
		ExcludedTalents = [],
		Faces = null,
		Hairs = null,
		HairColors = null,
		Beards = null,
		Bodies = this.Const.Bodies.AllMale,
		Ethnicity = 0,
		Level = 1,
		BeardChance = 60,
		Names = [],
		LastNames = [],
		Titles = [],
		RawDescription = "",
		BackgroundDescription = "",
		GoodEnding = null,
		BadEnding = null,
		Name = "",
		BackgroundType = this.Const.BackgroundType.None,
		AlignmentMin = this.Const.LegendMod.Alignment.Dreaded,
		AlignmentMax = this.Const.LegendMod.Alignment.Saintly,
		Modifiers = {
			Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[0],
			ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[0],
			Meds = this.Const.LegendMod.ResourceModifiers.Meds[0],
			Stash = this.Const.LegendMod.ResourceModifiers.Stash[0],
			Healing = this.Const.LegendMod.ResourceModifiers.Healing[0],
			Injury = this.Const.LegendMod.ResourceModifiers.Injury[0],
			Repair = this.Const.LegendMod.ResourceModifiers.Repair[0],
			Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[0],
			Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[0],
			Barter = this.Const.LegendMod.ResourceModifiers.Barter[0],
			ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[0],
			MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[0],
			Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[0],
			Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[0],
			Scout = this.Const.LegendMod.ResourceModifiers.Scout[0],
			Gathering = this.Const.LegendMod.ResourceModifiers.Gather[0],
			Training = this.Const.LegendMod.ResourceModifiers.Training[0],
			Enchanting = 0.0,
			Terrain = [
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0,
				0.0
			]
		},
		PerkTreeDynamicMins = {
			Weapon = 8,
			Defense = 2,
			Traits = 7,
			Enemy = 1,
			EnemyChance = 0.01,
			Class = 1,
			ClassChance = 0.01,
			Magic = 1,
			MagicChance = 0
		},
		PerkTreeDynamicMinsMagic = {
			Weapon = 8,
			Defense = 2,
			Traits = 8,
			Enemy = 1,
			EnemyChance = 0.01,
			Class = 1,
			ClassChance = 0.01,
			Magic = 1,
			MagicChance = 0.001
		},
		PerkTreeDynamicMinsBeast = {
			Weapon = 8,
			Defense = 2,
			Traits = 8,
			Enemy = 1,
			EnemyChance = 0.05,
			Class = 1,
			ClassChance = 0.02,
			Magic = 1,
			MagicChance = 0.001
		},
		PerkTreeDynamic = {
			Weapon = [],
			Defense = [],
			Traits = [],
			Enemy = [],
			Class = [],
			Magic = []
		},
		CustomPerkTree = null,
		PerkTreeMap = null,
		PerkTree = null,
		IsGuaranteed = [],
		IsScenarioOnly = false,
		IsNew = true,
		IsUntalented = false,
		IsOffendedByViolence = false,
		IsCombatBackground = false,
		IsNoble = false,
		IsLowborn = false
	},
	function convertToBackgroundType()
	{
		local addToBackgroundType = function ( _type, _constType )
		{
			if (!_type)
			{
				return;
			}

			this.m.BackgroundType = this.m.BackgroundType == this.Const.BackgroundType.None ? _constType : this.m.BackgroundType | _constType;
		};
		addToBackgroundType(this.m.IsScenarioOnly, this.Const.BackgroundType.Scenario);
		addToBackgroundType(this.m.IsUntalented, this.Const.BackgroundType.Untalented);
		addToBackgroundType(this.m.IsOffendedByViolence, this.Const.BackgroundType.OffendedByViolence);
		addToBackgroundType(this.m.IsCombatBackground, this.Const.BackgroundType.Combat);
		addToBackgroundType(this.m.IsNoble, this.Const.BackgroundType.Noble);
		addToBackgroundType(this.m.IsLowborn, this.Const.BackgroundType.Lowborn);
	}

	function isExcluded( _id )
	{
		return this.m.Excluded.find(_id) != null;
	}

	function isBackgroundType( _type )
	{
		return (this.m.BackgroundType & _type) != 0;
	}

	function addBackgroundType( _type )
	{
		if (!this.isBackgroundType(_type))
		{
			this.m.BackgroundType = this.m.BackgroundType | _type;
		}
	}

	function removeBackgroundType( _type )
	{
		if (this.isBackgroundType(_type))
		{
			this.m.BackgroundType -= _type;
		}
		else
		{
			this.logError(_type + " is not contained in " + this.getID());
		}
	}

	function getEthnicity()
	{
		return this.m.Ethnicity;
	}

	function getExcludedTalents()
	{
		return this.m.ExcludedTalents;
	}

	function getGoodEnding()
	{
		return this.m.GoodEnding;
	}

	function getBadEnding()
	{
		return this.m.BadEnding;
	}

	function getModifiers()
	{
		return this.m.Modifiers;
	}

	function create()
	{
		this.m.Type = this.Const.SkillType.Background | this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Background;
		this.m.DailyCostMult = this.Math.rand(90, 110) * 0.01;
	}

	function getIconColored()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.ConvertedCultist))
		{
			return "ui/backgrounds/background_34.png";
		}

		return this.m.Icon;
	}

	function isHidden()
	{
		return this.skill.isHidden() || this.isBackgroundType(this.Const.BackgroundType.Scenario);
	}

	function getName()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.ConvertedCultist))
		{
			return "Background: Cultist " + this.m.Name;
		}

		return "Background: " + this.m.Name;
	}

	function getNameOnly()
	{
		return this.m.Name;
	}

	function getPerkTreeGroupDescription( _p, _prefix = "" )
	{
		if (_p.len() == 0)
		{
			return "";
		}

		local i = 0;
		local text = _prefix + " " + _p[i].Descriptions[this.Math.rand(0, _p[i].Descriptions.len() - 1)];

		if (i == _p.len() - 1)
		{
			return text + ".\n";
		}

		i = 1;

		if (i == _p.len() - 1)
		{
			text = text + " and " + _p[i].Descriptions[this.Math.rand(0, _p[i].Descriptions.len() - 1)];
			return text + ".\n";
		}

		for( text = text + ", "; i < _p.len(); i = i )
		{
			text = text + _p[i].Descriptions[this.Math.rand(0, _p[i].Descriptions.len() - 1)];

			if (i < _p.len() - 2)
			{
				text = text + ", ";
			}
			else if (i < _p.len() - 1)
			{
				text = text + " and ";
			}

			i = ++i;
		}

		return text + ".\n";
	}

	function getPerkBackgroundDescription( _tree )
	{
		local text = "";
		text = text + this.getPerkTreeGroupDescription(_tree.Weapon, "Has an aptitude for");
		text = text + this.getPerkTreeGroupDescription(_tree.Defense, "Likes wearing");
		text = text + this.getPerkTreeGroupDescription(_tree.Enemy, "Prefers fighting");
		text = text + this.getPerkTreeGroupDescription(_tree.Class, "Is skilled in");
		text = text + this.getPerkTreeGroupDescription(_tree.Traits, "");
		return text;
	}

	function getBackgroundDescription( _desc )
	{
		local text = "";

		if (_desc)
		{
			text = text + this.m.BackgroundDescription + "\n";
			text = text + "\n" + this.getPerkBackgroundDescription(this.m.PerkTreeDynamic) + "\n";
		}

		local mtext = "";

		foreach( k, v in this.m.Modifiers )
		{
			if (k == "Terrain")
			{
				continue;
			}

			if (v == 0)
			{
				continue;
			}

			switch(k)
			{
			case "Ammo":
			case "Meds":
			case "Stash":
				mtext = mtext + (k + " +" + v + "\n");
				break;

			case "ArmorParts":
				mtext = mtext + ("Tools +" + v + "\n");
				break;

			default:
				v = v * 100;
				mtext = mtext + (k + " +" + v + "%\n");
			}
		}

		if (mtext != "")
		{
			text = text + ("\n" + mtext);
		}

		local terrains = this.m.Modifiers.Terrain;
		local val = 0.0;
		local ttext = "";
		val = terrains[2] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nPlains +" + val + "%");
		}

		val = terrains[3] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nSwamp +" + val + "%");
		}

		val = terrains[4] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nHills +" + val + "%");
		}

		val = terrains[5] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nForests +" + val + "%");
		}

		val = terrains[9] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nMountains +" + val + "%");
		}

		val = terrains[11] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nFarmland +" + val + "%");
		}

		val = terrains[12] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nSnow +" + val + "%");
		}

		val = terrains[13] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nBadlands +" + val + "%");
		}

		val = terrains[14] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nHighlands +" + val + "%");
		}

		val = terrains[15] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nStepps +" + val + "%");
		}

		val = terrains[17] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nDeserts +" + val + "%");
		}

		val = terrains[18] * 100.0;

		if (val > 0)
		{
			ttext = ttext + ("\nOases +" + val + "%");
		}

		if (ttext != "")
		{
			text = text + ("\nTerrain Movement Modifiers:" + ttext);
		}

		return text;
	}

	function getBackgroundDescriptionTooltip( _desc )
	{
		local tooltip = [];

		if (_desc)
		{
			tooltip.extend([
				{
					id = 2,
					type = "description",
					text = this.m.BackgroundDescription
				},
				{
					id = 3,
					type = "text",
					text = this.getPerkBackgroundDescription(this.m.PerkTreeDynamic)
				}
			]);
		}

		local capacities = [
			{
				key = "Stash",
				name = "Inventory Space",
				icon = "ui/icons/bag_icon.png"
			},
			{
				key = "ArmorParts",
				name = "Tools and Supplies",
				icon = "ui/icons/asset_supplies_icon.png"
			},
			{
				key = "Ammo",
				name = "Ammunition",
				icon = "ui/icons/asset_ammo_icon.png"
			},
			{
				key = "Meds",
				name = "Medical Supplies",
				icon = "ui/icons/asset_medicine_icon.png"
			}
		];
		local capacityTitle = true;

		foreach( c in capacities )
		{
			if (this.m.Modifiers[c.key] != 0)
			{
				if (capacityTitle)
				{
					tooltip.push({
						id = 4,
						type = "hint",
						text = "[u]Company Capacity[/u]"
					});
					capacityTitle = false;
				}

				tooltip.push({
					id = 4,
					type = "hint",
					icon = c.icon,
					text = c.name + " " + ::Legends.S.colorize("" + ::Legends.S.getSign(this.m.Modifiers[c.key]) + this.Math.abs(this.m.Modifiers[c.key]), this.m.Modifiers[c.key])
				});
			}
		}

		local skills = [
			{
				key = "Healing",
				name = "Healing",
				icon = "ui/icons/banner_heal_icon.png"
			},
			{
				key = "Injury",
				name = "Treating Injuries",
				icon = "ui/icons/banner_heal_icon.png"
			},
			{
				key = "MedConsumption",
				name = "Medical Supplies Efficiency",
				icon = "ui/icons/banner_heal_icon.png"
			},
			{
				key = "Repair",
				name = "Repairing",
				icon = "ui/icons/banner_repair_icon.png"
			},
			{
				key = "ToolConsumption",
				name = "Tools Efficiency",
				icon = "ui/icons/banner_repair_icon.png"
			},
			{
				key = "Salvage",
				name = "Salvaging",
				icon = "ui/icons/banner_scrap_icon.png"
			},
			{
				key = "Crafting",
				name = "Crafting",
				icon = "ui/icons/banner_craft_icon.png"
			},
			{
				key = "Scout",
				name = "Scouting",
				icon = "ui/icons/banner_scout_icon.png"
			},
			{
				key = "Training",
				name = "Training",
				icon = "ui/icons/banner_train_icon.png"
			},
			{
				key = "Fletching",
				name = "Fletching",
				icon = "ui/icons/banner_fletch_icon.png"
			},
			{
				key = "Gathering",
				name = "Gathering Supplies",
				icon = "ui/icons/banner_gather_icon.png"
			},
			{
				key = "Hunting",
				name = "Hunting",
				icon = "ui/icons/banner_hunt_icon.png"
			},
			{
				key = "Enchanting",
				name = "Enchanting",
				icon = "ui/icons/banner_enchant_icon.png"
			},
			{
				key = "Barter",
				name = "Bartering",
				icon = "ui/icons/banner_rest_icon.png"
			}
		];
		local skillsTitle = true;

		foreach( s in skills )
		{
			if (this.m.Modifiers[s.key] != 0)
			{
				if (skillsTitle)
				{
					tooltip.push({
						id = 5,
						type = "hint",
						text = "[u]Company Skills[/u]"
					});
					skillsTitle = false;
				}

				tooltip.push({
					id = 5,
					type = "hint",
					icon = s.icon,
					text = s.name + " " + ::Legends.S.colorize("" + (this.m.Modifiers[s.key] > 0 ? "+" : "-") + this.m.Modifiers[s.key] * 100 + "%", this.m.Modifiers[s.key])
				});
			}
		}

		local terrain = [
			{
				key = 2,
				name = "Plains"
			},
			{
				key = 3,
				name = "Swamps"
			},
			{
				key = 4,
				name = "Hills"
			},
			{
				key = 5,
				name = "Forests"
			},
			{
				key = 9,
				name = "Mountains"
			},
			{
				key = 11,
				name = "Farmland"
			},
			{
				key = 12,
				name = "Snow"
			},
			{
				key = 13,
				name = "Badlands"
			},
			{
				key = 14,
				name = "Highlands"
			},
			{
				key = 15,
				name = "Steppes"
			},
			{
				key = 17,
				name = "Deserts"
			},
			{
				key = 18,
				name = "Oases"
			}
		];
		local terrainTitle = true;

		foreach( t in terrain )
		{
			if (this.m.Modifiers.Terrain[t.key] != 0)
			{
				if (terrainTitle)
				{
					tooltip.push({
						id = 6,
						type = "hint",
						text = "[u]Terrain Movement Modifiers[/u]"
					});
					terrainTitle = false;
				}

				tooltip.push({
					id = 6,
					type = "hint",
					icon = "ui/icons/tracking_disabled.png",
					text = t.name + " " + ::Legends.S.colorize("" + (this.m.Modifiers.Terrain[t.key] > 0 ? "+" : "-") + this.m.Modifiers.Terrain[t.key] * 100 + "%", this.m.Modifiers.Terrain[t.key])
				});
			}
		}

		return tooltip;
	}

	function getGenericTooltip()
	{
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			}
		];

		if (::Legends.Mod.ModSettings.getSetting("ShowCharacterBackgroundType").getValue())
		{
			tooltip.push({
				id = 2,
				type = "description",
				text = this.getBackgroundTypes() + "\n\n"
			});
		}

		tooltip.extend(this.getBackgroundDescriptionTooltip(true));
		return tooltip;
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
			}
		];

		if (this.getContainer() != null)
		{
			ret.extend(this.getAttributesTooltip());
		}

		return ret;
	}

	function getAttributesTooltip()
	{
		if (this.getContainer().getActor().getLevel() >= 11)
		{
			return [];
		}

		local calculateAttribute = function ( attribute, maximum = false )
		{
			local bro = this.getContainer().getActor();
			local attributeMin = this.Const.AttributesLevelUp[attribute].Min + this.Math.min(bro.m.Talents[attribute], 2);
			local attributeMax = this.Const.AttributesLevelUp[attribute].Max;

			if (bro.m.Talents[attribute] == 3)
			{
				attributeMax = attributeMax + 1;
			}

			local levelUps = this.Math.max(11 - bro.getLevel() + bro.getLevelUps(), 0);
			local attributeValue = maximum ? attributeMax * levelUps : attributeMin * levelUps;

			switch(attribute)
			{
			case this.Const.Attributes.Hitpoints:
				return attributeValue + bro.getBaseProperties().Hitpoints;
				break;

			case this.Const.Attributes.Bravery:
				return attributeValue + bro.getBaseProperties().Bravery;
				break;

			case this.Const.Attributes.Fatigue:
				return attributeValue + bro.getBaseProperties().Stamina;
				break;

			case this.Const.Attributes.Initiative:
				return attributeValue + bro.getBaseProperties().Initiative;
				break;

			case this.Const.Attributes.MeleeSkill:
				return attributeValue + bro.getBaseProperties().MeleeSkill;
				break;

			case this.Const.Attributes.RangedSkill:
				return attributeValue + bro.getBaseProperties().RangedSkill;
				break;

			case this.Const.Attributes.MeleeDefense:
				return attributeValue + bro.getBaseProperties().MeleeDefense;
				break;

			case this.Const.Attributes.RangedDefense:
				return attributeValue + bro.getBaseProperties().RangedDefense;
				break;

			default:
				return 0;
				break;
			}
		};
		local a = {
			Hitpoints = [
				calculateAttribute(this.Const.Attributes.Hitpoints),
				calculateAttribute(this.Const.Attributes.Hitpoints, true)
			],
			Bravery = [
				calculateAttribute(this.Const.Attributes.Bravery),
				calculateAttribute(this.Const.Attributes.Bravery, true)
			],
			Fatigue = [
				calculateAttribute(this.Const.Attributes.Fatigue),
				calculateAttribute(this.Const.Attributes.Fatigue, true)
			],
			Initiative = [
				calculateAttribute(this.Const.Attributes.Initiative),
				calculateAttribute(this.Const.Attributes.Initiative, true)
			],
			MeleeSkill = [
				calculateAttribute(this.Const.Attributes.MeleeSkill),
				calculateAttribute(this.Const.Attributes.MeleeSkill, true)
			],
			RangedSkill = [
				calculateAttribute(this.Const.Attributes.RangedSkill),
				calculateAttribute(this.Const.Attributes.RangedSkill, true)
			],
			MeleeDefense = [
				calculateAttribute(this.Const.Attributes.MeleeDefense),
				calculateAttribute(this.Const.Attributes.MeleeDefense, true)
			],
			RangedDefense = [
				calculateAttribute(this.Const.Attributes.RangedDefense),
				calculateAttribute(this.Const.Attributes.RangedDefense, true)
			]
		};
		local bufferHealth = "";
		local bufferFatigue = "";
		local bufferBravery = "";
		local bufferInitiative = "";

		if (a.Hitpoints[0] >= 100)
		{
			bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
			bufferBravery = bufferBravery + "&nbsp;&nbsp;";
			bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
		}

		if (a.Hitpoints[1] >= 100)
		{
			bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
			bufferBravery = bufferBravery + "&nbsp;&nbsp;";
			bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
		}

		if (a.Fatigue[0] >= 100)
		{
			bufferHealth = bufferHealth + "&nbsp;&nbsp;";
			bufferBravery = bufferBravery + "&nbsp;&nbsp;";
			bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
		}

		if (a.Fatigue[1] >= 100)
		{
			bufferHealth = bufferHealth + "&nbsp;&nbsp;";
			bufferBravery = bufferBravery + "&nbsp;&nbsp;";
			bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
		}

		if (a.Bravery[0] >= 100)
		{
			bufferHealth = bufferHealth + "&nbsp;&nbsp;";
			bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
			bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
		}

		if (a.Bravery[1] >= 100)
		{
			bufferHealth = bufferHealth + "&nbsp;&nbsp;";
			bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
			bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
		}

		if (a.Initiative[0] >= 100)
		{
			bufferHealth = bufferHealth + "&nbsp;&nbsp;";
			bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
			bufferBravery = bufferBravery + "&nbsp;&nbsp;";
		}

		if (a.Initiative[1] >= 100)
		{
			bufferHealth = bufferHealth + "&nbsp;&nbsp;";
			bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
			bufferBravery = bufferBravery + "&nbsp;&nbsp;";
		}

		local tooltip = [
			{
				id = 103,
				type = "hint",
				text = "Projection of this character\'s base attribute ranges calculated as if that attribute is improved on every level up from current level to 11."
			},
			{
				id = 104,
				type = "hint",
				text = "[img]gfx/ui/icons/health_va11.png[/img] " + a.Hitpoints[0] + " to " + a.Hitpoints[1] + bufferHealth + "&nbsp;&nbsp;&nbsp;[img]gfx/ui/icons/melee_skill_va11.png[/img] " + a.MeleeSkill[0] + " to " + a.MeleeSkill[1]
			},
			{
				id = 105,
				type = "hint",
				text = "[img]gfx/ui/icons/fatigue_va11.png[/img] " + a.Fatigue[0] + " to " + a.Fatigue[1] + bufferFatigue + "&nbsp;&nbsp;&nbsp;[img]gfx/ui/icons/ranged_skill_va11.png[/img] " + a.RangedSkill[0] + " to " + a.RangedSkill[1]
			},
			{
				id = 106,
				type = "hint",
				text = "[img]gfx/ui/icons/bravery_va11.png[/img] " + a.Bravery[0] + " to " + a.Bravery[1] + bufferBravery + "&nbsp;&nbsp;&nbsp;[img]gfx/ui/icons/melee_defense_va11.png[/img] " + a.MeleeDefense[0] + " to " + a.MeleeDefense[1]
			},
			{
				id = 107,
				type = "hint",
				text = "[img]gfx/ui/icons/initiative_va11.png[/img] " + a.Initiative[0] + " to " + a.Initiative[1] + bufferInitiative + "&nbsp;&nbsp;&nbsp;[img]gfx/ui/icons/ranged_defense_va11.png[/img] " + a.RangedDefense[0] + " to " + a.RangedDefense[1]
			}
		];
		return tooltip;
	}

	function getPerkTreeDescription()
	{
		local text = "";

		foreach( i, group in this.m.PerkTree )
		{
			text = text + ("\nTier " + (i + 1) + ": ");

			foreach( p in group )
			{
				text = text + (p.Name + ", ");
			}
		}

		return text;
	}

	function getPerkTree()
	{
		if (this.m.PerkTree != null)
		{
			return this.m.PerkTree;
		}

		local pT = this.Const.Perks.PerksTreeTemplate;

		if (pT == null)
		{
			return [];
		}

		return pT.Tree;
	}

	function getPerk( _perk )
	{
		local id;
		local perkDef;

		if (typeof _perk == "string")
		{
			id = _perk;
			local basePerkDefObject = this.Const.Perks.findById(_perk);
			perkDef = this.Const.Perks.PerkDefs[basePerkDefObject.Const];
		}
		else
		{
			id = this.Const.Perks.PerkDefObjects[_perk].ID;
			perkDef = _perk;
		}

		if (!(id in this.m.PerkTreeMap))
		{
			return null;
		}

		return this.m.PerkTreeMap[id];
	}

	function addPerk( _perk, _row = 0, _isRefundable = true )
	{
		local perkDefObject = clone this.Const.Perks.PerkDefObjects[_perk];

		if (this.m.PerkTreeMap == null || perkDefObject.ID in this.m.PerkTreeMap)
		{
			return false;
		}

		perkDefObject.Row <- _row;
		perkDefObject.Unlocks <- _row;
		perkDefObject.IsRefundable <- _isRefundable;

		for( local i = this.getPerkTree().len(); i < _row + 1; i = i )
		{
			this.getPerkTree().push([]);
			i = ++i;
		}

		this.getPerkTree()[_row].push(perkDefObject);
		this.m.CustomPerkTree[_row].push(_perk);
		this.m.PerkTreeMap[perkDefObject.ID] <- perkDefObject;
		return true;
	}

	function addPerkGroup( _Tree )
	{
		foreach( index, arrAdd in _Tree )
		{
			foreach( perkAdd in arrAdd )
			{
				this.addPerk(perkAdd, index);
			}
		}
	}

	function removePerk( _perk )
	{
		local perkDefObject = this.Const.Perks.PerkDefObjects[_perk];

		if (!(perkDefObject.ID in this.m.PerkTreeMap))
		{
			return false;
		}

		local row = this.m.PerkTreeMap[perkDefObject.ID].Row;
		local perkTree = this.getPerkTree();

		foreach( i, perk in perkTree[row] )
		{
			if (perk.ID == perkDefObject.ID)
			{
				perkTree[row].remove(i);
				break;
			}
		}

		foreach( i, perk in this.m.CustomPerkTree[row] )
		{
			if (perk == _perk)
			{
				this.m.CustomPerkTree[row].remove(i);
				break;
			}
		}

		delete this.m.PerkTreeMap[perkDefObject.ID];
		return true;
	}

	function hasPerkGroup( _group )
	{
		foreach( row in _group.Tree )
		{
			foreach( perk in row )
			{
				if (!this.hasPerk(perk))
				{
					return false;
				}
			}
		}

		return true;
	}

	function removePerkGroup( _group )
	{
		foreach( i, row in _group.Tree )
		{
			foreach( perk in row )
			{
				this.removePerk(perk);
			}
		}
	}

	function hasPerk( _perk )
	{
		return this.Const.Perks.PerkDefObjects[_perk].ID in this.m.PerkTreeMap;
	}

	function buildDescription( _isFinal = false )
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Scenario))
		{
			return;
		}

		local villages = this.World.EntityManager.getSettlements();
		local citystates = [];
		local northern = [];

		for( local i = 0; i < villages.len(); i = i )
		{
			if (this.isKindOf(villages[i], "city_state"))
			{
				citystates.push(villages[i]);
			}
			else
			{
				northern.push(villages[i]);
			}

			i = ++i;
		}

		local brother = this.World.getPlayerRoster().getAll();
		brother = brother.len() != 0 ? brother[this.Math.rand(0, brother.len() - 1)].getName() : "";
		local vars = [
			[
				"townname",
				this.World.State.getCurrentTown() != null ? this.World.State.getCurrentTown().getNameOnly() : villages[this.Math.rand(0, villages.len() - 1)].getNameOnly()
			],
			[
				"randomtown",
				northern[this.Math.rand(0, northern.len() - 1)].getNameOnly()
			],
			[
				"randomcity",
				northern[0].getNameOnly()
			],
			[
				"randomcitystate",
				citystates.len() != 0 ? citystates[this.Math.rand(0, citystates.len() - 1)].getNameOnly() : ""
			],
			[
				"randomname",
				this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]
			],
			[
				"randomnoble",
				this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]
			],
			[
				"randomnamefemale",
				this.Const.Strings.CharacterNamesFemale[this.Math.rand(0, this.Const.Strings.CharacterNamesFemale.len() - 1)]
			],
			[
				"companyname",
				this.World.Assets.getName()
			],
			[
				"randombrother",
				brother
			]
		];
		this.onPrepareVariables(vars);

		if (!_isFinal)
		{
			this.m.RawDescription = this.buildTextFromTemplate(this.onBuildDescription(), vars);
		}

		vars.push([
			"name",
			this.getContainer().getActor().getNameOnly()
		]);
		vars.push([
			"fullname",
			this.getContainer().getActor().getName()
		]);
		vars.push([
			"title",
			this.getContainer().getActor().getTitle()
		]);
		this.Const.LegendMod.extendVarsWithPronouns(vars, this.getContainer().getActor().getGender());
		this.m.Description = this.buildTextFromTemplate(this.m.RawDescription, vars);
	}

	function onPrepareVariables( _vars )
	{
	}

	function buildAttributes( _tag = null, _attrs = null )
	{
		local a = [];

		if (_tag == "zombie")
		{
			a = {
				Hitpoints = [
					65,
					75
				],
				Bravery = [
					30,
					40
				],
				Stamina = [
					90,
					100
				],
				MeleeSkill = [
					42,
					52
				],
				RangedSkill = [
					27,
					37
				],
				MeleeDefense = [
					0,
					0
				],
				RangedDefense = [
					0,
					0
				],
				Initiative = [
					85,
					95
				]
			};
		}
		else if (_tag == "skeleton")
		{
			a = {
				Hitpoints = [
					50,
					60
				],
				Bravery = [
					30,
					40
				],
				Stamina = [
					90,
					100
				],
				MeleeSkill = [
					42,
					52
				],
				RangedSkill = [
					27,
					37
				],
				MeleeDefense = [
					0,
					5
				],
				RangedDefense = [
					0,
					5
				],
				Initiative = [
					90,
					100
				]
			};
		}
		else
		{
			a = {
				Hitpoints = [
					50,
					60
				],
				Bravery = [
					30,
					40
				],
				Stamina = [
					90,
					100
				],
				MeleeSkill = [
					47,
					57
				],
				RangedSkill = [
					32,
					42
				],
				MeleeDefense = [
					0,
					5
				],
				RangedDefense = [
					0,
					5
				],
				Initiative = [
					100,
					110
				]
			};
		}

		if (::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Enabled")
		{
			if (this.getContainer().getActor().getGender() == 1)
			{
				a.Hitpoints[0] -= 10;
				a.Hitpoints[1] -= 10;
				a.Stamina[0] += 10;
				a.Stamina[1] += 10;
			}
		}

		local c = this.onChangeAttributes();
		a.Hitpoints[0] += c.Hitpoints[0];
		a.Hitpoints[1] += c.Hitpoints[1];
		a.Bravery[0] += c.Bravery[0];
		a.Bravery[1] += c.Bravery[1];
		a.Stamina[0] += c.Stamina[0];
		a.Stamina[1] += c.Stamina[1];
		a.MeleeSkill[0] += c.MeleeSkill[0];
		a.MeleeSkill[1] += c.MeleeSkill[1];
		a.MeleeDefense[0] += c.MeleeDefense[0];
		a.MeleeDefense[1] += c.MeleeDefense[1];
		a.RangedSkill[0] += c.RangedSkill[0];
		a.RangedSkill[1] += c.RangedSkill[1];
		a.RangedDefense[0] += c.RangedDefense[0];
		a.RangedDefense[1] += c.RangedDefense[1];
		a.Initiative[0] += c.Initiative[0];
		a.Initiative[1] += c.Initiative[1];

		if (_attrs != null)
		{
			a.Hitpoints[0] += _attrs.Hitpoints[0];
			a.Hitpoints[1] += _attrs.Hitpoints[1];
			a.Bravery[0] += _attrs.Bravery[0];
			a.Bravery[1] += _attrs.Bravery[1];
			a.Stamina[0] += _attrs.Stamina[0];
			a.Stamina[1] += _attrs.Stamina[1];
			a.MeleeSkill[0] += _attrs.MeleeSkill[0];
			a.MeleeSkill[1] += _attrs.MeleeSkill[1];
			a.MeleeDefense[0] += _attrs.MeleeDefense[0];
			a.MeleeDefense[1] += _attrs.MeleeDefense[1];
			a.RangedSkill[0] += _attrs.RangedSkill[0];
			a.RangedSkill[1] += _attrs.RangedSkill[1];
			a.RangedDefense[0] += _attrs.RangedDefense[0];
			a.RangedDefense[1] += _attrs.RangedDefense[1];
			a.Initiative[0] += _attrs.Initiative[0];
			a.Initiative[1] += _attrs.Initiative[1];
		}

		local b = this.getContainer().getActor().getBaseProperties();
		b.ActionPoints = 9;
		local Hitpoints1 = this.Math.rand(a.Hitpoints[0], a.Hitpoints[1]);
		local Bravery1 = this.Math.rand(a.Bravery[0], a.Bravery[1]);
		local Stamina1 = this.Math.rand(a.Stamina[0], a.Stamina[1]);
		local MeleeSkill1 = this.Math.rand(a.MeleeSkill[0], a.MeleeSkill[1]);
		local RangedSkill1 = this.Math.rand(a.RangedSkill[0], a.RangedSkill[1]);
		local MeleeDefense1 = this.Math.rand(a.MeleeDefense[0], a.MeleeDefense[1]);
		local RangedDefense1 = this.Math.rand(a.RangedDefense[0], a.RangedDefense[1]);
		local Initiative1 = this.Math.rand(a.Initiative[0], a.Initiative[1]);
		local Hitpoints2 = this.Math.rand(a.Hitpoints[0], a.Hitpoints[1]);
		local Bravery2 = this.Math.rand(a.Bravery[0], a.Bravery[1]);
		local Stamina2 = this.Math.rand(a.Stamina[0], a.Stamina[1]);
		local MeleeSkill2 = this.Math.rand(a.MeleeSkill[0], a.MeleeSkill[1]);
		local RangedSkill2 = this.Math.rand(a.RangedSkill[0], a.RangedSkill[1]);
		local MeleeDefense2 = this.Math.rand(a.MeleeDefense[0], a.MeleeDefense[1]);
		local RangedDefense2 = this.Math.rand(a.RangedDefense[0], a.RangedDefense[1]);
		local Initiative2 = this.Math.rand(a.Initiative[0], a.Initiative[1]);
		local HitpointsAvg = this.Math.round((Hitpoints1 + Hitpoints2) / 2);
		local BraveryAvg = this.Math.round((Bravery1 + Bravery2) / 2);
		local StaminaAvg = this.Math.round((Stamina1 + Stamina2) / 2);
		local MeleeSkillAvg = this.Math.round((MeleeSkill1 + MeleeSkill2) / 2);
		local RangedSkillAvg = this.Math.round((RangedSkill1 + RangedSkill2) / 2);
		local MeleeDefenseAvg = this.Math.round((MeleeDefense1 + MeleeDefense2) / 2);
		local RangedDefenseAvg = this.Math.round((RangedDefense1 + RangedDefense2) / 2);
		local InitiativeAvg = this.Math.round((Initiative1 + Initiative2) / 2);
		b.Hitpoints = HitpointsAvg;
		b.Bravery = BraveryAvg;
		b.Stamina = StaminaAvg;
		b.MeleeSkill = MeleeSkillAvg;
		b.RangedSkill = RangedSkillAvg;
		b.MeleeDefense = MeleeDefenseAvg;
		b.RangedDefense = RangedDefenseAvg;
		b.Initiative = InitiativeAvg;
		this.getContainer().getActor().m.CurrentProperties = clone b;
		this.getContainer().getActor().setHitpoints(b.Hitpoints);
		local weighted = [];

		if (a.Hitpoints[1] == a.Hitpoints[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.Hitpoints - a.Hitpoints[0]) * 100.0 / (a.Hitpoints[1] - a.Hitpoints[0])));
		}

		if (a.Bravery[1] == a.Bravery[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.Bravery - a.Bravery[0]) * 100.0 / (a.Bravery[1] - a.Bravery[0])));
		}

		if (a.Stamina[1] == a.Stamina[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.Stamina - a.Stamina[0]) * 100.0 / (a.Stamina[1] - a.Stamina[0])));
		}

		if (a.MeleeSkill[1] == a.MeleeSkill[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.MeleeSkill - a.MeleeSkill[0]) * 100.0 / (a.MeleeSkill[1] - a.MeleeSkill[0])));
		}

		if (a.RangedSkill[1] == a.RangedSkill[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.RangedSkill - a.RangedSkill[0]) * 100.0 / (a.RangedSkill[1] - a.RangedSkill[0])));
		}

		if (a.MeleeDefense[1] == a.MeleeDefense[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.MeleeDefense - a.MeleeDefense[0]) * 100.0 / (a.MeleeDefense[1] - a.MeleeDefense[0])));
		}

		if (a.RangedDefense[1] == a.RangedDefense[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.RangedDefense - a.RangedDefense[0]) * 100.0 / (a.RangedDefense[1] - a.RangedDefense[0])));
		}

		if (a.Initiative[1] == a.Initiative[0])
		{
			weighted.push(50);
		}
		else
		{
			weighted.push(this.Math.floor((b.Initiative - a.Initiative[0]) * 100.0 / (a.Initiative[1] - a.Initiative[0])));
		}

		return weighted;
	}

	function rebuildPerkTree( _tree )
	{
		this.m.CustomPerkTree = _tree;
		this.m.CustomPerkTree = this.Const.Perks.MergeDynamicPerkTree(_tree, this.m.PerkTreeDynamic);
		local pT = this.Const.Perks.BuildCustomPerkTree(this.m.CustomPerkTree);
		this.m.PerkTree = pT.Tree;
		this.m.PerkTreeMap = pT.Map;
	}

	function getPerkTreeDynamicMins()
	{
		local mins = this.m.PerkTreeDynamicMins;

		if (this.World.Assets.getOrigin().getID() == "scenario.beast_hunters")
		{
			mins = this.m.PerkTreeDynamicMinsBeast;
		}
		else if (this.LegendsMod.Configs().LegendMagicEnabled())
		{
			mins = this.m.PerkTreeDynamicMinsMagic;
		}

		return mins;
	}

	function buildPerkTree()
	{
		local a = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};

		if (this.m.PerkTree != null)
		{
			return a;
		}

		if (this.m.CustomPerkTree == null)
		{
			local mins = this.getPerkTreeDynamicMins();
			local result = this.Const.Perks.GetDynamicPerkTree(mins, this.m.PerkTreeDynamic);
			this.m.CustomPerkTree = result.Tree;
			a = result.Attributes;
		}

		local pT = this.Const.Perks.BuildCustomPerkTree(this.m.CustomPerkTree);
		this.m.PerkTree = pT.Tree;
		this.m.PerkTreeMap = pT.Map;
		local origin = this.World.Assets.getOrigin();

		if (origin != null)
		{
			origin.onBuildPerkTree(this);
		}

		return a;
	}

	function updateAppearance()
	{
	}

	function addEquipment()
	{
		this.onAddEquipment();
		this.adjustHiringCostBasedOnEquipment();
	}

	function onUpdate( _properties )
	{
		if (this.m.DailyCost == 0 || this.getContainer().hasSkill("trait.player"))
		{
			_properties.DailyWage = 0;
		}
		else
		{
			if (this.isBackgroundType(this.Const.BackgroundType.ConvertedCultist))
			{
				this.m.DailyCost = 4;
			}

			local level = this.getContainer().getActor().getLevel();
			local wage = this.Math.round(this.m.DailyCost * this.m.DailyCostMult);
			_properties.DailyWage += wage * this.Math.pow(1.1, this.Math.min(10, level - 1));

			if (level > 11)
			{
				local previous = wage * this.Math.pow(1.1, 10);
				_properties.DailyWage += previous * this.Math.pow(1.03, level - 1 - 10) - previous;
			}
		}

		if (("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin() != null && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.getID() != "background.slave")
		{
			_properties.XPGainMult *= 0.9;
		}
	}

	function adjustHiringCostBasedOnEquipment()
	{
		local actor = this.getContainer().getActor();
		actor.m.HiringCost = this.Math.floor(this.m.HiringCost + 500 * this.Math.pow(this.m.Level - 1, 1.5));
		local items = actor.getItems().getAllItems();
		local cost = 0;

		foreach( i in items )
		{
			cost = cost + i.getValue();
		}

		cost = cost * 1.25;
		actor.m.HiringCost = actor.m.HiringCost + cost;
		actor.m.HiringCost *= 0.1;
		actor.m.HiringCost = this.Math.ceil(actor.m.HiringCost);
		actor.m.HiringCost *= 10;
	}

	function setAppearance( _tag = null )
	{
		if (this.m.HairColors == null)
		{
			return;
		}

		if (_tag == "zombie")
		{
			local actor = this.getContainer().getActor();
			local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];
			local body = actor.getSprite("body");
			local b = this.m.Bodies[this.Math.rand(0, this.m.Bodies.len() - 1)];
			body.setBrush(b);
			body.Saturation = 0.5;
			body.varySaturation(0.2);
			body.Color = this.createColor("#c1ddaa");
			body.varyColor(0.05, 0.05, 0.05);
			actor.getSprite("injury_body").setBrush("zombify_body_01");
			local head = actor.getSprite("head");
			head.setBrush(this.m.Faces[this.Math.rand(0, this.m.Faces.len() - 1)]);
			head.Saturation = body.Saturation;
			head.Color = body.Color;
			local hair = actor.getSprite("hair");
			hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.Zombie[this.Math.rand(0, this.Const.Hair.Zombie.len() - 1)]);
			hair.varyColor(0.02, 0.02, 0.02);

			if (this.Math.rand(1, 100) <= this.m.BeardChance)
			{
				local beard = actor.getSprite("beard");
				beard.setBrush("beard_" + hairColor + "_" + this.Const.Beards.Zombie[this.Math.rand(0, this.Const.Beards.Zombie.len() - 1)]);
				beard.Color = hair.Color;

				if (this.doesBrushExist(beard.getBrush().Name + "_top"))
				{
					local sprite = actor.getSprite("beard_top");
					sprite.setBrush(beard.getBrush().Name + "_top");
					sprite.Color = actor.getSprite("hair").Color;
				}
			}
		}
		else if (_tag == "skeleton")
		{
			local actor = this.getContainer().getActor();
			local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];
			local body = actor.getSprite("body");
			body.setBrush("bust_skeleton_body_0" + this.Math.rand(1, 2));
			body.Saturation = 0.8;
			body.varySaturation(0.2);
			body.varyColor(0.025, 0.025, 0.025);
			actor.getSprite("injury_body").setBrush("bust_skeleton_body_injured");
			local head = actor.getSprite("head");
			head.setBrush("bust_skeleton_head");
			head.Color = body.Color;
			head.Saturation = body.Saturation;
			local hair = actor.getSprite("hair");
			hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.ZombieOnly[this.Math.rand(0, this.Const.Hair.ZombieOnly.len() - 1)]);
			hair.varyColor(0.02, 0.02, 0.02);

			if (this.Math.rand(1, 100) <= this.m.BeardChance)
			{
				local beard = actor.getSprite("beard");
				beard.setBrush("beard_" + hairColor + "_" + this.Const.Beards.ZombieOnly[this.Math.rand(0, this.Const.Beards.ZombieOnly.len() - 1)]);
				beard.Color = hair.Color;

				if (this.doesBrushExist(beard.getBrush().Name + "_top"))
				{
					local sprite = actor.getSprite("beard_top");
					sprite.setBrush(beard.getBrush().Name + "_top");
					sprite.Color = actor.getSprite("hair").Color;
				}
			}
		}
		else
		{
			local actor = this.getContainer().getActor();
			local hairColor = this.m.HairColors[this.Math.rand(0, this.m.HairColors.len() - 1)];

			if (this.m.Faces != null)
			{
				local sprite = actor.getSprite("head");
				sprite.setBrush(this.m.Faces[this.Math.rand(0, this.m.Faces.len() - 1)]);
				sprite.Color = this.createColor("#fbffff");
				sprite.varyColor(0.05, 0.05, 0.05);
				sprite.varySaturation(0.1);
				local body = actor.getSprite("body");
				body.Color = sprite.Color;
				body.Saturation = sprite.Saturation;
			}

			if (this.m.Hairs != null && this.Math.rand(0, this.m.Hairs.len()) != this.m.Hairs.len())
			{
				local sprite = actor.getSprite("hair");
				sprite.setBrush("hair_" + hairColor + "_" + this.m.Hairs[this.Math.rand(0, this.m.Hairs.len() - 1)]);

				if (hairColor != "grey")
				{
					sprite.varyColor(0.1, 0.1, 0.1);
				}
				else
				{
					sprite.varyBrightness(0.1);
				}
			}

			if (this.m.Beards != null && this.Math.rand(1, 100) <= this.m.BeardChance)
			{
				local beard = actor.getSprite("beard");
				beard.setBrush("beard_" + hairColor + "_" + this.m.Beards[this.Math.rand(0, this.m.Beards.len() - 1)]);
				beard.Color = actor.getSprite("hair").Color;

				if (this.doesBrushExist(beard.getBrush().Name + "_top"))
				{
					local sprite = actor.getSprite("beard_top");
					sprite.setBrush(beard.getBrush().Name + "_top");
					sprite.Color = actor.getSprite("hair").Color;
				}
			}

			if (this.m.Bodies != null)
			{
				local body = this.m.Bodies[this.Math.rand(0, this.m.Bodies.len() - 1)];
				actor.getSprite("body").setBrush(body);
				actor.getSprite("injury_body").setBrush(body + "_injured");
			}

			if (this.m.Ethnicity == 1 && hairColor != "grey")
			{
				local hair = actor.getSprite("hair");
				hair.Saturation = 0.8;
				hair.setBrightness(0.4);
				local beard = actor.getSprite("beard");
				beard.Color = hair.Color;
				beard.Saturation = hair.Saturation;
				local beard_top = actor.getSprite("beard_top");
				beard_top.Color = hair.Color;
				beard_top.Saturation = hair.Saturation;
			}
		}

		this.onSetAppearance();
	}

	function onAddEquipment()
	{
	}

	function onSetAppearance()
	{
	}

	function calculateAdditionalRecruitmentLevels()
	{
		if (::Legends.Mod.ModSettings.getSetting("RecruitScaling").getValue())
		{
			local roster = this.World.getPlayerRoster().getAll();
			local levels = 0;
			local count = 0;

			foreach( i, bro in roster )
			{
				local brolevel = bro.getLevel();
				levels = levels + brolevel;
				count = count + 1;
			}

			local avgLevel = this.Math.floor(levels / count);
			local busRep = this.World.Assets.getBusinessReputation();
			local repPoints = this.Math.floor(busRep / 1000);
			local repLevelAvg = this.Math.floor((avgLevel + repPoints) / 4);
			local broLevel = this.Math.rand(1, repLevelAvg);
			return broLevel - 1;
		}
		else
		{
			return 0;
		}
	}

	function onAdded()
	{
		if (this.m.DailyCost > 0)
		{
			this.m.DailyCost += 1;
		}

		local actor = this.getContainer().getActor();
		actor.m.Background = this;
		actor.m.Ethnicity = this.m.Ethnicity;

		if (!this.m.IsNew)
		{
			return;
		}

		if (("State" in this.Tactical) && this.Tactical.State != null && this.Tactical.State.isScenarioMode())
		{
			return;
		}

		this.m.IsNew = false;

		if (this.m.LastNames.len() == 0 && this.m.Ethnicity == 1)
		{
			this.m.LastNames = this.Const.Strings.SouthernNamesLast;
		}

		if (actor.getTitle() == "" && this.m.LastNames.len() != 0 && this.Math.rand(0, 1) == 1)
		{
			actor.setTitle(this.m.LastNames[this.Math.rand(0, this.m.LastNames.len() - 1)]);
		}

		if (actor.getTitle() == "" && this.m.Titles.len() != 0 && this.Math.rand(0, 3) == 3)
		{
			actor.setTitle(this.m.Titles[this.Math.rand(0, this.m.Titles.len() - 1)]);
		}

		if (actor.getNameOnly() == "")
		{
			local names = this.m.Names;

			if (names == null || this.m.Names.len() == 0)
			{
				names = this.Const.Strings.CharacterNames;

				if (this.m.Ethnicity == 1)
				{
					names = this.Const.Strings.SouthernNames;
				}
				else if (this.m.Ethnicity == 2)
				{
					names = this.Const.Strings.BarbarianNames;
				}

				if (this.isBackgroundType(this.Const.BackgroundType.Female))
				{
					names = this.Const.Strings.CharacterNamesFemale;

					if (this.m.Ethnicity == 1)
					{
						names = this.Const.Strings.SouthernFemaleNames;
					}
					else if (this.m.Ethnicity == 2)
					{
						names = this.Const.Strings.CharacterNamesFemaleNorse;
					}
				}
			}

			actor.setName(names[this.Math.rand(0, names.len() - 1)]);
		}

		this.m.Level += actor.m.Background.calculateAdditionalRecruitmentLevels();

		if (this.m.Level != 1)
		{
			if (this.m.Level <= 11)
			{
				actor.m.PerkPoints = this.m.Level - 1;
			}
			else
			{
				local vetPerk = this.getContainer().getActor().getVeteranPerks();

				if (vetPerk == 0)
				{
					actor.m.PerkPoints = 10;
				}
				else
				{
					actor.m.PerkPoints = 10 + this.Math.floor((this.m.Level - 11) / this.getContainer().getActor().getVeteranPerks());
				}
			}

			actor.m.PerkPoints = this.m.Level - 1;
			actor.m.LevelUps = this.m.Level - 1;
			actor.m.Level = this.m.Level;
			actor.m.XP = this.Const.LevelXP[this.m.Level - 1];
		}
	}

	function onBuildDescription()
	{
		return "";
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();

		if (this.isBackgroundType(this.Const.BackgroundType.Female))
		{
			actor.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
				"sounds/humans/legends/woman_light_01.wav",
				"sounds/humans/legends/woman_light_02.wav",
				"sounds/humans/legends/woman_light_03.wav",
				"sounds/humans/legends/woman_light_04.wav",
				"sounds/humans/legends/woman_light_05.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
				"sounds/humans/legends/woman_injury_01.wav",
				"sounds/humans/legends/woman_injury_02.wav",
				"sounds/humans/legends/woman_injury_03.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Death] = [
				"sounds/humans/legends/woman_death_01.wav",
				"sounds/humans/legends/woman_death_02.wav",
				"sounds/humans/legends/woman_death_03.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Fatigue] = [
				"sounds/humans/legends/woman_fatigue_01.wav",
				"sounds/humans/legends/woman_fatigue_02.wav",
				"sounds/humans/legends/woman_fatigue_03.wav",
				"sounds/humans/legends/woman_fatigue_04.wav",
				"sounds/humans/legends/woman_fatigue_05.wav",
				"sounds/humans/legends/woman_fatigue_06.wav",
				"sounds/humans/legends/woman_fatigue_07.wav"
			];
			actor.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
				"sounds/humans/legends/woman_flee_01.wav",
				"sounds/humans/legends/woman_flee_02.wav",
				"sounds/humans/legends/woman_flee_03.wav",
				"sounds/humans/legends/woman_flee_04.wav",
				"sounds/humans/legends/woman_flee_05.wav",
				"sounds/humans/legends/woman_flee_06.wav"
			];
			actor.m.SoundPitch = this.Math.rand(105, 115) * 0.01;
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function getBackgroundTypes()
	{
		local ret = "";

		foreach( type, name in ::Const.BackgroundTypeName )
		{
			if (this.isBackgroundType(::Const.BackgroundType[type]))
			{
				ret = ret + (name + ", ");
			}
		}

		if (ret.len() == 0)
		{
			return "";
		}

		return "[color=" + this.Const.UI.Color.NegativeValue + "]Background Type: " + ret.slice(0, ret.len() - 2) + "[/color]";
	}

	function setGender( _gender )
	{
	}

	function Convert()
	{
		this.addBackgroundType(this.Const.BackgroundType.ConvertedCultist);
		local cultistGroup = [
			[
				this.Const.Perks.PerkDefs.LegendSpecialistNinetailsSkill
			],
			[
				this.Const.Perks.PerkDefs.LegendSpecCultHood
			],
			[
				this.Const.Perks.PerkDefs.LegendSpecialistNinetailsDamage
			],
			[],
			[
				this.Const.Perks.PerkDefs.LegendPrepareGraze
			],
			[
				this.Const.Perks.PerkDefs.LegendSpecCultArmor
			],
			[
				this.Const.Perks.PerkDefs.LegendLacerate
			]
		];
		this.addPerkGroup(cultistGroup);
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeString(this.m.Description);
		_out.writeString(this.m.RawDescription);
		_out.writeU8(this.m.Level);
		_out.writeBool(this.m.IsNew);
		_out.writeF32(this.m.DailyCostMult);
		_out.writeBool(this.isBackgroundType(this.Const.BackgroundType.Female));
		_out.writeBool(this.isBackgroundType(this.Const.BackgroundType.ConvertedCultist));

		if (this.m.CustomPerkTree == null)
		{
			_out.writeU8(0);
		}
		else
		{
			_out.writeU8(this.m.CustomPerkTree.len());

			for( local i = 0; i < this.m.CustomPerkTree.len(); i = i )
			{
				_out.writeU8(this.m.CustomPerkTree[i].len());

				for( local j = 0; j < this.m.CustomPerkTree[i].len(); j = j )
				{
					_out.writeU16(this.m.CustomPerkTree[i][j]);
					j = ++j;
				}

				i = ++i;
			}
		}

		local nonRefundablePerks = [];

		foreach( row in this.m.PerkTree )
		{
			foreach( perk in row )
			{
				if (!perk.IsRefundable)
				{
					nonRefundablePerks.push(this.Const.Perks.PerkDefs[perk.Const]);
				}
			}
		}

		_out.writeU8(nonRefundablePerks.len());

		foreach( perk in nonRefundablePerks )
		{
			_out.writeU16(perk);
		}
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.Description = _in.readString();
		this.m.RawDescription = _in.readString();
		this.m.Level = _in.readU8();
		this.m.IsNew = _in.readBool();

		if (_in.getMetaData().getVersion() >= 39)
		{
			this.m.DailyCostMult = _in.readF32();
		}
		else
		{
			this.m.DailyCostMult = 1.0;
		}

		if (_in.readBool())
		{
			this.addBackgroundType(this.Const.BackgroundType.Female);
			this.setGender(1);
		}
		else
		{
			this.setGender(0);
		}

		if (_in.readBool())
		{
			this.addBackgroundType(this.Const.BackgroundType.ConvertedCultist);
		}

		this.m.CustomPerkTree = [];
		local numRows = _in.readU8();

		for( local i = 0; i < numRows; i = i )
		{
			local numPerks = _in.readU8();
			local perks = [];

			for( local j = 0; j < numPerks; j = j )
			{
				perks.push(_in.readU16());
				j = ++j;
			}

			this.m.CustomPerkTree.push(perks);
			i = ++i;
		}

		if (this.m.CustomPerkTree != null)
		{
			this.buildPerkTree();
		}

		local num = _in.readU8();

		for( local i = 0; i < num; i++ )
		{
			this.getPerk(_in.readU16()).IsRefundable <- false;
		}
	}

});

