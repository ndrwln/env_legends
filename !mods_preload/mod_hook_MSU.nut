local gt = this.getroottable();
gt.Const.LegendMod.hookMSU <- function ()
{
	local canResurrectOnTile = this.MSU.Tile.canResurrectOnTile;
	this.MSU.Tile.canResurrectOnTile = function ( _tile, _force = false )
	{
		if (!canResurrectOnTile(_tile, _force))
		{
			return false;
		}

		if (_tile.Properties.Effect != null && _tile.Properties.Effect.Type == "legend_holyflame")
		{
			return false;
		}

		return true;
	};
	this.Const.Items.addNewWeaponType("MagicStaff", "Mystic Staff");
	this.Const.Items.addNewWeaponType("Whip", "Whip");
	::MSU.System.Keybinds.KeybindsByMod[::MSU.VanillaID].world_toggleCamping.Function = function ()
	{
		if (!this.m.MenuStack.hasBacksteps())
		{
			this.showCampScreen();
			return true;
		}
	};
};

