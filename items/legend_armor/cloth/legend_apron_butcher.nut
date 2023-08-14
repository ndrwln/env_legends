this.legend_apron_butcher <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend_armor.body.legend_apron_butcher";
		this.m.Name = "Butcher\'s Apron";
		this.m.Description = "A rugged apron worn by butchers to protect against accidental cuts.";
		this.m.Variants = [
			7,
			8,
			9,
			10
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 50;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_legend_apron" + "_" + variant;
		this.m.SpriteDamaged = "bust_legend_apron" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_legend_apron" + "_" + variant + "_dead";
		this.m.IconLarge = "legend_armor/inventory_legend_apron" + "_" + variant + ".png";
		this.m.Icon = "legend_armor/icon_legend_apron" + "_" + variant + ".png";
	}

});

