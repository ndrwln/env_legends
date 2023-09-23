this.legend_noble_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_noble_scale";
		this.m.Name = "Noble Scale";
		this.m.Description = "A very well crafted scale mail armor";
		this.m.ArmorDescription = "Includes scaled armor.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 2000;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -10;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_noble_scale" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_noble_scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_noble_scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_noble_scale" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_noble_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_noble_scale" + "_" + variant + ".png";
	}

});

