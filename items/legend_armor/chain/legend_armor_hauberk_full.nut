this.legend_armor_hauberk_full <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_hauberk_full";
		this.m.Name = "Full Hauberk";
		this.m.Description = "A long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.ArmorDescription = "Includes a long and heavy chainmail that offers good protection but is very fatiguing to wear.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 2500;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -14;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_hauberk_full" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_hauberk_full" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_hauberk_full" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_hauberk_full" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_hauberk_full" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_hauberk_full" + "_" + variant + ".png";
	}

});

