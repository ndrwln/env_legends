this.legend_southern_cloth <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_southern_cloth";
		this.m.Name = "Nomad Outer Robe";
		this.m.Description = "A nomad cloth robe worn as an outer protection against both the heat and against cuts and bruises.";
		this.m.ArmorDescription = "Includes a cloth robe";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 50;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -2;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_cloth" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_cloth" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_cloth" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_cloth" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_cloth" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_cloth" + "_" + variant + ".png";
	}

});

