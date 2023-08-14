this.getroottable().Const.LegendMod.hookCharacterBackground <- function ()
{
	::mods_hookBaseClass("skills/backgrounds/character_background", function ( o )
	{
		local create = o.create;
		o.create = function ()
		{
			create();
			this.convertToBackgroundType();
		};
	});
	delete this.Const.LegendMod.hookCharacterBackground;
};

