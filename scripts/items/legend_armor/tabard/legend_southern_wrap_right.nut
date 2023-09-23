this.legend_southern_wrap_right <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_southern_wrap_right";
		this.m.Name = "Right Sided Wrap";
		this.m.Description = "A southern wrapped cloth wrapped around the right shoulder";
		this.m.ArmorDescription = "Has a right sided southern wrap";
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
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 2;
		this.m.ConditionMax = 2;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_wrap_right" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_wrap_right" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_wrap_right" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_wrap_right" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_wrap_right" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_wrap_right" + "_" + variant + ".png";
	}

});

