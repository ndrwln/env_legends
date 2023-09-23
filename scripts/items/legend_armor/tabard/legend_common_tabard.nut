this.legend_common_tabard <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_common_tabard";
		this.m.Name = "Tabard";
		this.m.Description = "A flowing cloth covering for armor, to show your allegiance. Offers minimal protection and small boost to morale.";
		this.m.ArmorDescription = "Has a flowing cloth tabard";
		this.m.Variants = [
			101,
			102,
			103,
			104,
			105,
			106,
			107,
			108,
			109,
			110,
			111,
			112,
			113
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 200;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_tabard" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_tabard" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_tabard" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_tabard" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_tabard" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_tabard" + "_" + variant + ".png";
	}

});

