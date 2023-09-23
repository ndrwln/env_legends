this.world_active_contract_panel_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "ActiveContractPanelModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function show( _withSlideAnimation = false )
	{
		if (!this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("show", _withSlideAnimation);
		}
	}

	function hide( _withSlideAnimation = false )
	{
		if (this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("hide", _withSlideAnimation);
		}
	}

	function updateContract( _contract = null )
	{
		this.m.JSHandle.asyncCall("loadFromData", this.convertToUI(_contract));
	}

	function clearContract()
	{
		this.m.JSHandle.asyncCall("hide", false);
	}

	function onShowContractDetails()
	{
		this.World.State.showDialogPopup("Cancel Contract", "Cancelling an active contract will adversely affect your reputation as a reliable sword for hire, as well as the relation to your current employer - especially if you received any payment in advance.\n\nAre you sure you want to cancel?", this.onContractCancelled.bindenv(this), null);
	}

	function onContractCancelled()
	{
		this.World.Contracts.removeContract(this.World.Contracts.getActiveContract());
	}

	function convertToUI( _contract )
	{
		local ret = {
			Title = _contract.getTitle(),
			Lists = _contract.getUIBulletpoints()
		};
		return ret;
	}

});

