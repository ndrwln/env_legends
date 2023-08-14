this.legend_southern_padded <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_southern_padded";
		this.m.Name = "Southern padded shirt";
		this.m.Description = "A padded shirt fashioned from slightly thinner and lighter leather than that used in the north";
		this.m.ArmorDescription = "Covered in a padded shirt";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 400;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -7;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_padded" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_padded" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_padded" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_padded" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_padded" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_padded" + "_" + variant + ".png";
	}

});

