this.legend_tunic_wrap <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_tunic_wrap";
		this.m.Name = "Linen Tunic Wrap";
		this.m.Description = "A simple cloth tunic. Fashionable but offering little in protection.";
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
		this.m.Value = 25;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = -1;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_tunic_wrap" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_tunic_wrap" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_tunic_wrap" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_tunic_wrap" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_tunic_wrap" + "_" + variant + ".png";
	}

});

