this.legend_sash <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_sash";
		this.m.Name = "Sash";
		this.m.Description = "Has a flowing cloth sash.";
		this.m.ArmorDescription = "Has a flowing cloth sash.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 3;
		this.m.ConditionMax = 3;
		this.m.StaminaModifier = 0;
		this.m.ItemType = this.m.ItemType;
		this.m.Bravery = 1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_sash" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_sash" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_sash" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_sash" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_sash" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_sash" + "_" + variant + ".png";
	}

});

