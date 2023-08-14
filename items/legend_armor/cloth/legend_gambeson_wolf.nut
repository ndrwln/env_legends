this.legend_gambeson_wolf <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_gambeson_wolf";
		this.m.Name = "Wolf Gambeson";
		this.m.Description = "A sturdy and heavy padded tunic that offers decent protection.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 300;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -9;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_gambeson_wolf" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_gambeson_wolf" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_gambeson_wolf" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_gambeson_wolf" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_gambeson_wolf" + "_" + variant + ".png";
	}

});

