this.legend_armor_plate_milanese <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_milanese";
		this.m.Name = "Full Harness of Plate Armor";
		this.m.Description = "A complete harness of steel plate armor.";
		this.m.ArmorDescription = "Includes a full set of solid plated steel with greaves.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 5000;
		this.m.Condition = 170;
		this.m.ConditionMax = 170;
		this.m.StaminaModifier = -26;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_plate_milanese" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_plate_milanese" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_milanese" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_plate_milanese" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_plate_milanese" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_plate_milanese" + "_" + variant + ".png";
	}

});

