this.legend_armor_cloak_noble <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_noble";
		this.m.Name = "Noble Cloak";
		this.m.Description = "A fine cloak made of light foreign silk, provides protection and looks great. ";
		this.m.ArmorDescription = "Has a flowing light cloak";
		this.m.Variants = [
			1,
			2,
			4,
			5,
			6,
			7,
			25
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 3000;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -2;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 3;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_cloak" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_cloak" + "_" + variant + ".png";
	}

});

