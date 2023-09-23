this.relic_hood <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.relic_hood";
		this.m.Name = "Relic Hood and belts";
		this.m.Description = "Straps, bags, hood and relic of a knightly order. Offers physical and spiritual protection.";
		this.m.ArmorDescription = "Straps, bags, hood and relic of a knightly order. Offers physical and spiritual protection.";
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
			10
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_relic_hood" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_relic_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_relic_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_relic_hood" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_relic_hood" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_relic_hood" + "_" + variant + ".png";
	}

});

