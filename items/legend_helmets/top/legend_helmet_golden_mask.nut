this.legend_helmet_golden_mask <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_golden_mask";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "An exquisit golden mask from distant royalty, exceptional craftmanship.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1500;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -4;
		this.m.Vision = -1;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
		this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_golden_mask" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_golden_mask" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_golden_mask" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_golden_mask" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(1, 1) * -1;
		this.m.StaminaModifier = this.Math.rand(3, 4) * -1;
		this.m.Condition = this.Math.rand(60, 80);
		this.m.ConditionMax = this.m.Condition;
	}

});

