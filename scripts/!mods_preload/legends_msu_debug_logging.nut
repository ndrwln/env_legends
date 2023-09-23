::Const.LegendMod.setupDebug <- function ()
{
	::Legends.Mod.Debug.disable();
	::Const.LegendMod.Debug <- {};
	::Const.LegendMod.Debug.Flags <- {
		Default = "default",
		ContractCategories = "contractCategories",
		ContractCategoriesVerbose = "contractCategoriesVerbose"
	};
	::Const.LegendMod.Debug.FlagDefs <- [
		{
			ID = ::Const.LegendMod.Debug.Flags.Default,
			Name = "Default",
			Description = "This is the MSU default for logs which haven\'t been given any specific flag",
			Value = false
		},
		{
			ID = ::Const.LegendMod.Debug.Flags.ContractCategories,
			Name = "Contract Categories",
			Description = "Logs related to Contract Categories",
			Value = false
		},
		{
			ID = ::Const.LegendMod.Debug.Flags.ContractCategoriesVerbose,
			Name = "Contract Categories (Verbose)",
			Description = "Addtional logs related to Contract Categories\n\n[color=" + this.Const.UI.Color.NegativeValue + "]WARNING: Known to cause crashes due to excessive logging[/color]",
			Value = false
		}
	];

	foreach( f in ::Const.LegendMod.Debug.FlagDefs )
	{
		::Legends.Mod.Debug.setFlag(f.ID, f.Value);
	}
};

