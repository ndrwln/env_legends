this.legend_animal_pelt <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_animal_pelt";
		this.m.Name = "Animal Pelt";
		this.m.Description = "A cloak of dark wool that wraps around the shoulders.";
		this.m.ArmorDescription = "Includes a dark wooly cloak";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -2;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_animal_pelt" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_animal_pelt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_animal_pelt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_animal_pelt" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_animal_pelt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_animal_pelt" + "_" + variant + ".png";
	}

});

