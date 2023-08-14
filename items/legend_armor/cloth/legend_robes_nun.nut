this.legend_robes_nun <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_robes_nun";
		this.m.Name = "Nun\'s Robe";
		this.m.Description = "A rugged, large robe made of simple cloth usually worn by young nuns.";
		this.m.Variants = [
			6,
			7
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 22;
		this.m.ConditionMax = 22;
		this.m.StaminaModifier = -1;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_robes" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_robes" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_robes" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_robes" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_robes" + "_" + variant + ".png";
	}

});

