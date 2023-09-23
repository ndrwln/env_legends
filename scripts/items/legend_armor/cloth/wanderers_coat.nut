this.wanderers_coat <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.wanderers_coat";
		this.m.Name = "Wanderer\'s Coat";
		this.m.Description = "A coat well suited to wandering the lands";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 120;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -4;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_wanderers_coat" + "_" + variant;
		this.m.SpriteDamaged = "bust_wanderers_coat" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_wanderers_coat" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_wanderers_coat" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_wanderers_coat" + "_" + variant + ".png";
	}

});

