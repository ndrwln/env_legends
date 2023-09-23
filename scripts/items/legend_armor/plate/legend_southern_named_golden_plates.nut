this.legend_southern_named_golden_plates <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_southern_named_golden_plates";
		this.m.Name = "composite lamellar plates";
		this.m.Description = "A heavy composite armor consisting of padding and lamellar elements";
		this.m.ArmorDescription = "Includes composite lamellar elements";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 5600;
		this.m.Condition = 200;
		this.m.ConditionMax = 200;
		this.m.StaminaModifier = -36;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_named_southern_gold_plates" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_named_southern_gold_plates" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_named_southern_gold_plates" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_named_southern_gold_plates" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_named_southern_gold_plates" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_named_southern_gold_plates" + "_" + variant + ".png";
	}

});

