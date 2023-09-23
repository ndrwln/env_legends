this.town_taxidermist_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		InventoryFilter = this.Const.Items.ItemFilter.All
	},
	function create()
	{
		this.m.ID = "TaxidermistDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function clear()
	{
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

	function queryBlueprints()
	{
		return {
			Title = "Taxidermist",
			SubTitle = "A taxidermist can create useful items from all kinds of beast trophies that you bring",
			Blueprints = this.World.Crafting.getQualifiedBlueprintsForUI(this.m.InventoryFilter),
			Assets = this.m.Parent.queryAssetsInformation()
		};
	}

	function loadBlueprints()
	{
		local result = this.queryBlueprints();
		this.m.JSHandle.asyncCall("loadFromData", result);
	}

	function onFilterAll()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.All)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.All;
			this.loadBlueprints();
		}
	}

	function onFilterWeapons()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Weapons)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Weapons;
			this.loadBlueprints();
		}
	}

	function onFilterArmor()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Armor)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Armor;
			this.loadBlueprints();
		}
	}

	function onFilterMisc()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Misc)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Misc;
			this.loadBlueprints();
		}
	}

	function onFilterUsable()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Usable)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Usable;
			this.loadBlueprints();
		}
	}

	function FixVariantImage( _result )
	{
		local result;

		if (_result.ItemPath != 0)
		{
			local item = this.new(_result.ItemPath);

			if (("m" in item) && "Faction" in item.m)
			{
				item.setFaction(_result.Variant);
			}
			else
			{
				item.setVariant(item.m.Variants[_result.Variant - 1]);
			}

			if (item.m.ID == "shield.faction_kite_shield" || item.m.ID == "shield.heater_kite_shield")
			{
				local blueprint = this.World.Crafting.getBlueprint(_result.ID);
				blueprint.m.PreviewCraftable = item;
			}

			result = item.m.IconLarge != null ? item.m.IconLarge : item.m.Icon;
		}

		return result;
	}

	function onCraft( _result )
	{
		local blueprint = this.World.Crafting.getBlueprint(_result.ID);

		if (_result.Variant != 0)
		{
			blueprint.setVariant(_result.Variant);
		}

		blueprint.craft();
		this.World.Assets.addMoney(-blueprint.getCost());

		if (blueprint.getSounds().len() != 0)
		{
			this.Sound.play(blueprint.getSounds()[this.Math.rand(0, blueprint.getSounds().len() - 1)], 1.0);
		}

		this.World.Statistics.getFlags().increment("ItemsCrafted");
		this.World.Ambitions.updateUI();

		if (blueprint.isCraftable())
		{
			return {
				Blueprints = null,
				Assets = this.m.Parent.queryAssetsInformation()
			};
		}
		else
		{
			return this.queryBlueprints();
		}
	}

});

