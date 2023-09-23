this.legend_sackcloth_patched <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_sackcloth_patched";
		this.m.Name = "Leather Wraps";
		this.m.Description = "Various patches of rough leather sewn together.";
		this.m.Variants = [
			3,
			19,
			20,
			21,
			22,
			23,
			24,
			25
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_sackcloth" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_sackcloth" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_sackcloth" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_sackcloth" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_sackcloth" + "_" + variant + ".png";
	}

});

