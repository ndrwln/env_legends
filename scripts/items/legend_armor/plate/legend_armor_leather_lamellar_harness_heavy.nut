this.legend_armor_leather_lamellar_harness_heavy <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_lamellar_harness_heavy";
		this.m.Name = "Lamellar Harness";
		this.m.Description = "A body armor made of thick overlapping metal plates that cover most of the upper body.";
		this.m.ArmorDescription = "Includes body armor made of thick overlapping metal plates that cover most of the upper body.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 1750;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -20;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_lamellar_harness_heavy" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_lamellar_harness_heavy" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_lamellar_harness_heavy" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_leather_lamellar_harness_heavy" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_leather_lamellar_harness_heavy" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_leather_lamellar_harness_heavy" + "_" + variant + ".png";
	}

});

