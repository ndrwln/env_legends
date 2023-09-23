this.anatomist_robe <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.anatomist_robe";
		this.m.Name = "Anatomist\'s Robe";
		this.m.Description = "A dark robe and gloves worn by those who tinker with flesh and filth";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 350;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -7;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_anatomist_robe" + "_" + variant;
		this.m.SpriteDamaged = "bust_anatomist_robe" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_anatomist_robe" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_anatomist_robe" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_anatomist_robe" + "_" + variant + ".png";
	}

});

