this.legend_southern_noble_surcoat <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_southern_noble_surcoat";
		this.m.Name = "Southern Noble Surcoat";
		this.m.Description = "A studded and heavy padded coat that offers decent protection.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 350;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -6;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_southern_noble_cloth" + "_" + variant;
		this.m.SpriteDamaged = "bust_southern_noble_cloth" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_southern_noble_cloth" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_southern_noble_cloth" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_southern_noble_cloth" + "_" + variant + ".png";
	}

});

