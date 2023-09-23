::Const.LegendMod.addLegendItemTypes <- function ()
{
	::Const.Items.addNewItemType("HorseArmor");
	::Const.Items.ItemFilter.HorseArmor <- ::Const.Items.ItemType.HorseArmor;
	::Const.Items.addNewItemType("HorseHelmet");
	::Const.Items.addNewItemType("Cultist", "Cultist Item");
	::Const.Items.addNewItemType("Net", "Net Item");
	::Const.Items.addNewItemType("Shortbow", "Shortbow Item");
	::Const.Items.addNewItemType("Pitchfork", "Pitchfork Item");
	delete ::Const.LegendMod.addLegendItemTypes;
};

