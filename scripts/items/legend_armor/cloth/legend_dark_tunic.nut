this.legend_dark_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_dark_tunic";
		this.m.Name = "Dark Tunic";
		this.m.Description = "A heavy cloth tunic. bulky but offering some protection.";
		this.m.Variants = [
			1,
			2
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -4;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_dark_tunic" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_dark_tunic" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_dark_tunic" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_dark_tunic" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_dark_tunic" + "_" + variant + ".png";
	}

});

