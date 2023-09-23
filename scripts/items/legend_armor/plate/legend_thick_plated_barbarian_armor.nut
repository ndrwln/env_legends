this.legend_thick_plated_barbarian_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_thick_plated_barbarian_armor";
		this.m.Name = "Thick Plated Barbarian Armor";
		this.m.Description = "A heavy armor that is made from mostly metal. Only one chosen by the ancestors will own a set like this.";
		this.m.ArmorDescription = "Includes A heavy armor that is made from mostly metal. Only one chosen by the ancestors will own a set like this.";
		this.m.Variants = [
			96
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 1500;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -26;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_body" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_body" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body" + "_" + variant + "_dead";
		this.m.Icon = "armor/icon_body_armor" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor/icon_body_armor" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "armor/inventory_body_armor" + "_" + variant + ".png";
	}

});

