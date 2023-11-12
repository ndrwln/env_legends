::Const.LegendMod.addTooltips <- function ()
{
	::Legends.Mod.Tooltips.setTooltips({
		CampingPresets = {
			ButtonSavePreset = ::MSU.Class.BasicTooltip("Save Preset", "Save the current camping assignments to the currently selected numbered preset slot"),
			ButtonLoadPreset = ::MSU.Class.BasicTooltip("Load Preset", "Load the camping assignments from the currently selected numbered preset slot"),
			ButtonPresetName = ::MSU.Class.BasicTooltip("Customize Preset Name", "Give a custom name to the currently selected numbered preset slot"),
			ButtonPresetSlot = ::MSU.Class.BasicTooltip(function ( _data )
			{
				return "Preset Slot " + (_data.index + 1);
			}, function ( _data )
			{
				local name = ::World.Camp.getPresetName(_data.index);

				if (name)
				{
					return name;
				}
				else
				{
					return "";
				}
			}),
			PresetNameDialog = {
				ButtonDelete = ::MSU.Class.BasicTooltip("Delete Preset Name", "Delete the current preset slot\'s custom name and close this pop-up"),
				ButtonCancel = ::MSU.Class.BasicTooltip("Cancel Changes", "Discard any changes and close this pop-up"),
				ButtonOk = ::MSU.Class.BasicTooltip("Save Preset Name", "Save the input name as the current preset slot\'s custom name and close this pop-up")
			}
		},
		Camping = {
			ButtonAssignAll = ::MSU.Class.BasicTooltip("Assign All", "Assign all mercenaries to the current tent"),
			ButtonConfigure = ::MSU.Class.CustomTooltip(function ( _data )
			{
				local ret = [];

				if (_data.tent == ::Const.World.CampBuildings.Hunter)
				{
					if (::World.Camp.getBuildingByID(::Const.World.CampBuildings.Hunter).getUpgraded())
					{
						ret.push({
							id = 0,
							type = "title",
							text = "Hunting Mode"
						});
						ret.push({
							id = 1,
							type = "description",
							text = "Customize the priorities of the hunting party."
						});
					}
					else
					{
						ret.push({
							id = 0,
							type = "title",
							text = "Hunting Mode"
						});
						ret.push({
							id = 1,
							type = "description",
							text = "Customize the priorities of the hunting party.\n\n" + ::Const.UI.getColorized("Requires the Kitchen Tent upgrade", ::Const.UI.Color.NegativeValue)
						});
					}
				}
				else
				{
					ret.push({
						id = 0,
						type = "title",
						text = "Configure"
					});
					ret.push({
						id = 1,
						type = "description",
						text = "There are no special configurations for this tent."
					});
				}

				return ret;
			})
		},
		CampingHuntingMode = {
			Default = ::MSU.Class.BasicTooltip("Default Mode", "Your hunting party will carry out their activities at the baseline rates."),
			Cook = ::MSU.Class.BasicTooltip("Meal Preparation", this.format("Allow cooks more time to prepare better food.\n\nDoubles the drop rate of %s, but increases foraging and hunting time by about %s", ::Const.UI.getColorized("improved food items", ::Const.UI.Color.PositiveValue), ::Const.UI.getColorized("40%", ::Const.UI.Color.NegativeValue))),
			Brew = ::MSU.Class.BasicTooltip("Alcohol Brewing", this.format("Focus on brewing alcoholic drinks.\n\nDoubles the drop rate of %s, but increases foraging and hunting time by about %s", ::Const.UI.getColorized("brewed items", ::Const.UI.Color.PositiveValue), ::Const.UI.getColorized("40%", ::Const.UI.Color.NegativeValue))),
			Hunt = ::MSU.Class.BasicTooltip("Focused Hunting", this.format("Your hunting party will %s for animals or monsters, taking their time to scour the remains for loot.\n\nDoubles the drop rate of %s, but increases hunting time by about %s\n\n%s are required for loot items to be obtainable", ::Const.UI.getColorized("only hunt", ::Const.UI.Color.PositiveValue), ::Const.UI.getColorized("loot items", ::Const.UI.Color.PositiveValue), ::Const.UI.getColorized("40%", ::Const.UI.Color.NegativeValue), ::Const.UI.getColorized("Expert Hunters", ::Const.UI.Color.NegativeValue))),
			Forage = ::MSU.Class.BasicTooltip("Focused Foraging", this.format("Your hunting party will %s for food and do so quickly.\n\nDecreases foraging time by about %s", ::Const.UI.getColorized("only forage", ::Const.UI.Color.PositiveValue), ::Const.UI.getColorized("15%", ::Const.UI.Color.PositiveValue)))
		},
		Placeholder = ::MSU.Class.BasicTooltip("Placeholder", "Under development")
	});
};

