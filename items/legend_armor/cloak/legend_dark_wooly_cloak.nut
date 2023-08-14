this.legend_dark_wooly_cloak <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_dark_wooly_cloak";
		this.m.Name = "Dark Wooly Cloak";
		this.m.Description = "A cloak of dark wool that wraps around the shoulders.";
		this.m.ArmorDescription = "Includes a dark wooly cloak";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 120;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -2;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_dark_wooly_cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_dark_wooly_cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_dark_wooly_cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_dark_wooly_cloak" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_dark_wooly_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_dark_wooly_cloak" + "_" + variant + ".png";
	}

});

