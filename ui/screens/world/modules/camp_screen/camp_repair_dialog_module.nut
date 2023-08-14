this.camp_repair_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Title = "Repairs",
		Description = "Items in the queue will be repaired from left to right, top to bottom. Assign workers to repair items in the commanders tent.",
		InventoryFilter = this.Const.Items.ItemFilter.All
	},
	function create()
	{
		this.m.ID = "CampRepairDialogModule";
		this.ui_module.create();
	}

	function getTent()
	{
		return this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Repair);
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function onShow()
	{
		this.getTent().onInit();
		return this.queryLoad();
	}

	function queryLoad()
	{
		local result = {
			Title = this.m.Title,
			SubTitle = this.m.Description,
			Assets = this.assetsInformation(),
			Stash = [],
			Repairs = [],
			Capacity = this.getTent().getCapacity()
		};
		this.UIDataHelper.convertRepairItemsToUIData(this.getTent().getRepairs(), result.Repairs, this.Const.UI.ItemOwner.Shop);
		this.UIDataHelper.convertRepairItemsToUIData(this.getTent().getStash(), result.Stash, this.Const.UI.ItemOwner.Stash, this.m.InventoryFilter);
		return result;
	}

	function assetsInformation()
	{
		return {
			Supplies = this.World.Assets.getArmorParts(),
			SuppliesMax = this.World.Assets.getMaxArmorParts(),
			SuppliesRequired = this.getTent().getRequiredSupplies(),
			Time = this.getTent().getRequiredTime(),
			Brothers = this.getTent().getAssignedBros()
		};
	}

	function loadStashList()
	{
		local result = this.queryLoad();
		this.m.JSHandle.asyncCall("loadFromData", result);
	}

	function onSortButtonClicked()
	{
		if (this.Tactical.isActive())
		{
			this.getroottable().Stash.sort();
		}
		else
		{
			this.World.Assets.getStash().sort();
		}

		this.getTent().onInit();
		this.loadStashList();
	}

	function onFilterAll()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.All)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.All;
			this.loadStashList();
		}
	}

	function onFilterWeapons()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Weapons)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Weapons;
			this.loadStashList();
		}
	}

	function onFilterArmor()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Armor)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Armor;
			this.loadStashList();
		}
	}

	function onFilterBro()
	{
		if (this.m.InventoryFilter != 99)
		{
			this.m.InventoryFilter = 99;
			this.loadStashList();
		}
	}

	function onAssignAll()
	{
		this.getTent().assignAll(this.m.InventoryFilter);
		this.loadStashList();
	}

	function onRemoveAll()
	{
		this.getTent().removeAll();
		this.loadStashList();
	}

	function onSwapItem( _data )
	{
		local sourceItemIdx = _data[0];
		local sourceItemOwner = _data[1];
		local targetItemIdx = _data[2];
		local targetItemOwner = _data[3];
		this.getTent().swapItems(sourceItemOwner, sourceItemIdx, targetItemOwner, targetItemIdx);
		return this.queryLoad();
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

	function onBrothersButtonPressed()
	{
		this.m.Parent.onCommanderButtonPressed();
	}

});

