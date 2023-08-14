this.legend_armor_leather_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_scale";
		this.m.Name = "Leather Scale Armor";
		this.m.Description = "A thick leather scale armor for added protection.";
		this.m.ArmorDescription = "Includes scaled leather armor.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 600;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -9;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_scale" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_leather_scale" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_leather_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_leather_scale" + "_" + variant + ".png";
	}

});

