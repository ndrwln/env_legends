this.dukes_cloak <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.dukes_cloak";
		this.m.Name = "Dukes Cloak";
		this.m.Description = "A refined cloak for the distinguished cloak appreciator";
		this.m.ArmorDescription = "Has a flowing light cloak";
		this.m.Variants = [
			1,
			2,
			3,
			4
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 2000;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -2;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_dukes_cloak" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_dukes_cloak" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_dukes_cloak" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_dukes_cloak" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_dukes_cloak" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_dukes_cloak" + "_" + variant + ".png";
	}

});

