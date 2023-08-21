this.campfire_hire_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		CurrentSlot = 0
	},
	function setCurrentSlot( _s )
	{
		this.m.CurrentSlot = _s;
	}

	function create()
	{
		this.m.ID = "HireDialogModule";
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

	function queryHireInformation()
	{
		return {
			Roster = this.World.Retinue.getFollowersForUI(),
			Assets = this.m.Parent.queryAssetsInformation()
		};
	}

	function onHireFollower( _followerID )
	{
		local follower = this.World.Retinue.getFollower(_followerID);

		if (follower != null && !this.World.Retinue.hasFollower(_followerID))
		{
			local currentMoney = this.World.Assets.getMoney();
			local hiringCost = follower.getCost();

			if (currentMoney < hiringCost)
			{
				return {
					Result = this.Const.UI.Error.NotEnoughMoney,
					Assets = null
				};
			}

			this.World.Retinue.setFollower(this.m.CurrentSlot, follower);
			this.World.Assets.addMoney(-hiringCost);
			this.World.State.updateTopbarAssets();
			return {
				Result = 0
			};
		}

		return {
			Result = this.Const.UI.Error.RosterEntryNotFound,
			Assets = null
		};
	}

});

