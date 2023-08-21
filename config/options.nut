local gt = this.getroottable();

if (!("Options" in gt.Const))
{
	gt.Const.Options <- {};
}

gt.Const.Options.Video <- {
	MinResolution = {
		Width = 1024,
		Height = 768,
		Bpp = 32
	}
};

