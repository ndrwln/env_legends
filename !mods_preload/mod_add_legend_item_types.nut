::Const.LegendMod.addLegendItemTypes <- function ()
{
	::Const.Items.addNewItemType("HorseArmor");
	::Const.Items.ItemFilter.HorseArmor <- ::Const.Items.ItemType.HorseArmor;
	::Const.Items.addNewItemType("HorseHelmet");
	::Const.Items.addNewItemType("Cultist", "Cultist Item");
	delete ::Const.LegendMod.addLegendItemTypes;
};

