this.legend_armor_plate_ancient_scale_coat_restored <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_ancient_scale_coat_restored";
		this.m.Name = "Embalmed Ancient Scale Coat";
		this.m.Description = "A scale coat of ancient design that is miraculously well preserved and functional.";
		this.m.ArmorDescription = "Includes an ancient heavy scale coat.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 3000;
		this.m.Condition = 170;
		this.m.ConditionMax = 170;
		this.m.StaminaModifier = -23;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_plate_ancient_scale_coat_restored" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_scale_coat_restored" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_scale_coat_restored" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_plate_ancient_scale_coat_restored" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_plate_ancient_scale_coat_restored" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_plate_ancient_scale_coat_restored" + "_" + variant + ".png";
	}

});

