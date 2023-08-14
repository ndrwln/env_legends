this.fur_cloak <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.fur_cloak";
		this.m.Name = "Fur Cloak";
		this.m.Description = "A cloak made of rough chain and the fur of a beast";
		this.m.ArmorDescription = "Includes a fur cloak";
		this.m.Variants = [
			1,
			2,
			3,
			4
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 120;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -6;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_fur_cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_fur_cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_fur_cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_fur_cloak" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_fur_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_fur_cloak" + "_" + variant + ".png";
	}

});

