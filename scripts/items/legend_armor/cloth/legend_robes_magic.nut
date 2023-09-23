this.legend_robes_magic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_robes_magic";
		this.m.Name = "Magician\'s Robe";
		this.m.Description = "A soft shiny robe worn by practictioners of the arcane arts";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_magic_robe" + "_" + variant;
		this.m.SpriteDamaged = "bust_magic_robe" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_magic_robe" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_magic_robe" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_magic_robe" + "_" + variant + ".png";
	}

});

