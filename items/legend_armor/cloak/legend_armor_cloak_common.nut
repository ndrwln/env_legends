this.legend_armor_cloak_common <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_common";
		this.m.Name = "Simple Cloak";
		this.m.Description = "A rustic cloak made of strong warm wool, provides some small protection, from the weather if nothing else.";
		this.m.ArmorDescription = "Has a stout wool cloak";
		this.m.Variants = [
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			21,
			22,
			23,
			32,
			33,
			34
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak" + "_" + variant + ".png";
	}

});

