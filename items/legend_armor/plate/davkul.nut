this.davkul <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.davkul";
		this.m.Name = "fake Aspect of Davkul";
		this.m.Description = "";
		this.m.ArmorDescription = "";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 9000;
		this.m.Condition = 210;
		this.m.ConditionMax = 210;
		this.m.StaminaModifier = -25;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_named_plate" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_named_plate" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_named_plate" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_named_plate" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_named_plate" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_named_plate" + "_" + variant + ".png";
	}

});

