this.legend_southern_gambeson <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_southern_gambeson";
		this.m.Name = "Southern Gambeson";
		this.m.Description = "A sturdy and heavy padded tunic of southern origin that offers decent protection.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -8;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_southern_gambeson" + "_" + variant;
		this.m.SpriteDamaged = "bust_southern_gambeson" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_southern_gambeson" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_southern_gambeson" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_southern_gambeson" + "_" + variant + ".png";
	}

});

