this.noble_padded <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.noble_padded";
		this.m.Name = "Padded Noble Vest";
		this.m.Description = "An expensive padded vest with thick leather strapping";
		this.m.ArmorDescription = "Includes body vest with overlapping scales.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 280;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -13;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_noble_padded" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_noble_padded" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_noble_padded" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_noble_padded" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_noble_padded" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_noble_padded" + "_" + variant + ".png";
	}

});

