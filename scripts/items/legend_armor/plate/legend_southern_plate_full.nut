this.legend_southern_plate_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_southern_plate_full";
		this.m.Name = "Mail with Lamellar Plating";
		this.m.Description = "A lamellar shirt made from interlapping metal plates worn atop a mail shirt.";
		this.m.ArmorDescription = "interlapped with metal plates.";
		this.m.Variants = [
			1,
			2
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 750;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -12;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_plate_full" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_plate_full" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_plate_full" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_plate_full" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_plate_full" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_plate_full" + "_" + variant + ".png";
	}

});

