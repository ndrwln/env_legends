local gt = this.getroottable();

if (!("DLC" in gt.Const))
{
	gt.Const.DLC <- {};
	gt.Const.DLC.Mask <- 0;
}

if (!("Paladins" in gt.Const.DLC) || !this.Const.DLC.Paladins)
{
	this.Const.DLC.Paladins <- this.hasDLC(1910050) && this.Const.Serialization.Version >= 64;

	if (this.Const.DLC.Paladins)
	{
		this.Const.DLC.Mask = this.Const.DLC.Mask | 256;
		this.Const.LoadingScreens.push("ui/screens/loading_screen_11.jpg");
		local tips = [
			"With the \'Anatomists\' origin, defeating new enemies grants potions that mutate your men and grant them special abilities.",
			"With the \'Oathtakers\' origin, instead of ambitions you\'ll pick oaths that grant special boons and burdens."
		];
		this.Const.TipOfTheDay.extend(tips);
		this.Const.PlayerBanners.push("banner_32");
		this.Const.PlayerBanners.push("banner_33");
	}
}

