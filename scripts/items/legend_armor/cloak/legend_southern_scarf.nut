this.legend_southern_scarf <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_southern_scarf";
		this.m.Name = "Southern Scarf";
		this.m.Description = "A scarf that wraps around the shoulders.";
		this.m.ArmorDescription = "Includes a dark wooly cloak";
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
			12,
			13,
			14,
			15,
			16,
			17
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_scarf" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_scarf" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_scarf" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_scarf" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_scarf" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_scarf" + "_" + variant + ".png";
	}

});

