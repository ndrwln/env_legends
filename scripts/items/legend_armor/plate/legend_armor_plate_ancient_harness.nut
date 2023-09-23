this.legend_armor_plate_ancient_harness <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_plate_ancient_harness";
		this.m.Name = "Ancient Plate Harness";
		this.m.Description = "Made of thick metal plates and mail, this heavy ancient armor still offers great protection after countless years. It\'s crusted and rotten in parts, however, severely limiting the mobility of the wearer.";
		this.m.ArmorDescription = "Includes an ancient plate harness of thick metal plates and mail.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 1500;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -19;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_plate_ancient_harness" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_plate_ancient_harness" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_plate_ancient_harness" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_plate_ancient_harness" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_plate_ancient_harness" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_plate_ancient_harness" + "_" + variant + ".png";
	}

});

