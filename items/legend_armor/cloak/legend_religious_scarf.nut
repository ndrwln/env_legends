this.legend_religious_scarf <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_religious_scarf";
		this.m.Name = "Religious Scarf";
		this.m.Description = "An adorned scarf of dark wool that wraps around the shoulders.";
		this.m.ArmorDescription = "Includes a dark wooly cloak";
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
		this.m.Value = 60;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_religious_scarf" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_religious_scarf" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_religious_scarf" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_religious_scarf" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_religious_scarf" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_religious_scarf" + "_" + variant + ".png";
	}

});

