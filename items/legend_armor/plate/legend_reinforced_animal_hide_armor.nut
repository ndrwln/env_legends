this.legend_reinforced_animal_hide_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_reinforced_animal_hide_armor";
		this.m.Name = "Reinforced Animal Hide Armor";
		this.m.Description = "A reinforced animal hide armor fashioned from thick leather pieces with added mail and metal scales.";
		this.m.ArmorDescription = "Includes A reinforced animal hide armor fashioned from thick leather pieces with added mail and metal scales.";
		this.m.Variants = [
			97
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 175;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -9;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
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

