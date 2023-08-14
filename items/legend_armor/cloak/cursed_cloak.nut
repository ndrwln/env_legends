this.cursed_cloak <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.cursed_cloak";
		this.m.Name = "Cursed Cloak";
		this.m.Description = "A cloak made of the feathers of a strange creature of the abyss. ";
		this.m.ArmorDescription = "Has a cloak made of the feathers of a strange creature of the abyss.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -1;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_cursed_cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_cursed_cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_cursed_cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cursed_cloak" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_cursed_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cursed_cloak" + "_" + variant + ".png";
	}

});

