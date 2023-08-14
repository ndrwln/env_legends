this.legend_southern_wide_belt <- this.inherit("scripts/items/legend_armor/legend_armor_tabard", {
	function create()
	{
		this.legend_armor_tabard.create();
		this.m.ID = "legend_armor.body.legend_southern_wide_belt";
		this.m.Name = "Southern Wide Belt";
		this.m.Description = "A southern belt";
		this.m.ArmorDescription = "Has a southern belt";
		this.m.Variants = [
			1
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
		this.m.SpriteBack = "bust_southern_wide_belt" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_wide_belt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_wide_belt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_wide_belt" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_wide_belt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_wide_belt" + "_" + variant + ".png";
	}

});

