this.legend_noble_shawl <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_noble_shawl";
		this.m.Name = "Noble Shawl";
		this.m.Description = "A shawl made of exquisite material that wraps around the shoulders";
		this.m.ArmorDescription = "Includes a fine noble shawl";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 250;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_noble_shawl" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_noble_shawl" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_noble_shawl" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_noble_shawl" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_noble_shawl" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_noble_shawl" + "_" + variant + ".png";
	}

});

