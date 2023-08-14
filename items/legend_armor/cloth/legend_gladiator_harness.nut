this.legend_gladiator_harness <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_gladiator_harness";
		this.m.Name = "Gladiator Harness";
		this.m.Description = "A leather harness commonly worn by pit fighters in arenas of the southern city states.";
		this.m.Variants = [
			11
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 150;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -4;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_body_southern" + "_" + variant;
		this.m.SpriteDamaged = "bust_body_southern" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_body_southern" + "_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_body_southern_armor" + "_" + variant + ".png";
		this.m.Icon = "armor/icon_body_southern_armor" + "_" + variant + ".png";
	}

});

