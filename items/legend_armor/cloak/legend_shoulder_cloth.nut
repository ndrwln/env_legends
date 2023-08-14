this.legend_shoulder_cloth <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_shoulder_cloth";
		this.m.Name = "Shoulder Cloth";
		this.m.Description = "A Piece of cloth drapped over the shoulder";
		this.m.ArmorDescription = "Includes a shoulder cloth";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_shoulder_cloth" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_shoulder_cloth" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_shoulder_cloth" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_shoulder_cloth" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_shoulder_cloth" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_shoulder_cloth" + "_" + variant + ".png";
	}

});

