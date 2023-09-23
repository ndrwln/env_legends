this.legend_armor_cloak_heavy <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_armor_cloak_heavy";
		this.m.Name = "Heavy Cloak";
		this.m.Description = "A rustic cloak made of thick layered strong warm wool, provides protection from some blows but is quite hefty. ";
		this.m.ArmorDescription = "Has a heavy thick cloak";
		this.m.Variants = [
			3,
			8,
			15,
			16,
			17,
			18,
			19,
			20,
			24,
			26,
			27,
			28,
			29,
			30,
			31,
			35
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -4;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 2;
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

