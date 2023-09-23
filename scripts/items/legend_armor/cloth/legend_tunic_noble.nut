this.legend_tunic_noble <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_tunic_noble";
		this.m.Name = "Noble Tunic";
		this.m.Description = "A fine linen tunic of exquisite material, embroided with pleasing patterns. Fashionable but offering little in protection.";
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
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_tunic_collar_wide" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_tunic_collar_wide" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_tunic_collar_wide" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_tunic_collar_wide" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_tunic_collar_wide" + "_" + variant + ".png";
	}

});

