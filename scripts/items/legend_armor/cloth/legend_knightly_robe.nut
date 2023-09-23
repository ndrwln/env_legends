this.legend_knightly_robe <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_knightly_robe";
		this.m.Name = "Knight\'s Robe";
		this.m.Description = "A padded robe designed to go under armor and absorb blows";
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
		this.m.Value = 200;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -2;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_knightly_robe" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_knightly_robe" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_knightly_robe" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_knightly_robe" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_knightly_robe" + "_" + variant + ".png";
	}

});

