this.legend_armor_leather_riveted <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_riveted";
		this.m.Name = "Sellsword\'s Leather Armor";
		this.m.Description = "A long leather armor coat reinforced with metal plates.";
		this.m.ArmorDescription = "Includes a long leather coat reinforced with metal plates that offers good protection but is very fatiguing to wear.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 900;
		this.m.Condition = 95;
		this.m.ConditionMax = 95;
		this.m.StaminaModifier = -13;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_riveted" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_riveted" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_riveted" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_leather_riveted" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_leather_riveted" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_leather_riveted" + "_" + variant + ".png";
	}

});

