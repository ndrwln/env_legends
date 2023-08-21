this.town_travel_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Data = null
	},
	function setData( _r )
	{
		this.m.Data = _r;
	}

	function create()
	{
		this.m.ID = "TravelDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function clear()
	{
		this.m.Data = null;
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

	function queryTravelInformation()
	{
		return {
			Data = this.m.Data,
			Assets = this.m.Parent.queryAssetsInformation()
		};
	}

	function onTravel( _entryID )
	{
		local destination = this.World.getEntityByID(this.m.Data.Roster[_entryID].ID);

		if (destination == null)
		{
			return {
				Result = this.Const.UI.Error.RosterEntryNotFound,
				Assets = null
			};
		}

		local currentMoney = this.World.Assets.getMoney();
		local cost = this.m.Data.Roster[_entryID].Cost;

		if (currentMoney - cost < 0)
		{
			return {
				Result = this.Const.UI.Error.NotEnoughMoney,
				Assets = null
			};
		}

		this.World.Assets.setMoney(currentMoney - cost);
		this.Sound.play(this.Const.Sound.FastTravelByShip[this.Math.rand(0, this.Const.Sound.FastTravelByShip.len() - 1)]);
		this.fastTravelTo(destination);
		return {
			Result = 0,
			Assets = this.m.Parent.queryAssetsInformation()
		};
	}

	function fastTravelTo( _dest )
	{
		this.m.Data = null;
		this.World.State.getPlayer().setPos(_dest.getTile().Pos);
		this.World.setPlayerPos(this.World.State.getPlayer().getPos());
		this.World.getCamera().moveTo(_dest);
		this.onLeaveButtonPressed();

		if (this.World.State.getCurrentTown().getMusic() != _dest.getMusic())
		{
			this.Music.setTrackList(_dest.getMusic(), this.Const.Music.CrossFadeTime);
		}

		_dest.onEnter();
		this.World.State.setLastEnteredTown(_dest);
		this.m.Parent.setTown(this.WeakTableRef(_dest));
		this.m.Parent.refresh();
		this.Sound.setAmbience(0, this.World.State.getSurroundingAmbienceSounds(), this.Const.Sound.Volume.Ambience * this.Const.Sound.Volume.AmbienceTerrainInSettlement, this.World.getTime().IsDaytime ? this.Const.Sound.AmbienceMinDelay : this.Const.Sound.AmbienceMinDelayAtNight);
		this.Sound.setAmbience(1, _dest.getSounds(), this.Const.Sound.Volume.Ambience * this.Const.Sound.Volume.AmbienceInSettlement, this.World.getTime().IsDaytime ? this.Const.Sound.AmbienceMinDelay : this.Const.Sound.AmbienceMinDelayAtNight);
	}

});

