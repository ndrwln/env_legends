this.legend_bandages <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_bandages";
		this.m.Name = "Bandages";
		this.m.Description = "More for dressing wounds than protection";
		this.m.Variants = [
			1,
			2
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 1;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_bandages" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_bandages" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_bandages" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_bandages" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_bandages" + "_" + variant + ".png";
	}

});

