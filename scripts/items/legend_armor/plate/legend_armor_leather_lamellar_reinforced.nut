this.legend_armor_leather_lamellar_reinforced <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_lamellar_reinforced";
		this.m.Name = "Reinforced Leather Lamellar Armor";
		this.m.Description = "Numerous overlapping metal reinforced leather plates that provides excellent protection for most of the upper body but is very heavy.";
		this.m.ArmorDescription = "Includes armor of overlapping reinforced metal leather plates.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 350;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -7;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_lamellar_reinforced" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_lamellar_reinforced" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_lamellar_reinforced" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_leather_lamellar_reinforced" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_leather_lamellar_reinforced" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_leather_lamellar_reinforced" + "_" + variant + ".png";
	}

});

