this.legend_southern_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_southern_tunic";
		this.m.Name = "Southern Tunic";
		this.m.Description = "A light and well made checkered tunic southern origin.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -1;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_southern_checked" + "_" + variant;
		this.m.SpriteDamaged = "bust_southern_checked" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_southern_checked" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_southern_checked" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_southern_checked" + "_" + variant + ".png";
	}

});

