this.legend_armor_short_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_short_mail";
		this.m.Name = "Light Mail";
		this.m.Description = "A shorter and lighter chainmail that offers good protection and is fatiguing to wear.";
		this.m.ArmorDescription = "Includes a shorter and lighter chainmail that offers good protection but is fatiguing to wear.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 500;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -8;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_short_mail" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_short_mail" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_short_mail" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_short_mail" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_short_mail" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_short_mail" + "_" + variant + ".png";
	}

});

