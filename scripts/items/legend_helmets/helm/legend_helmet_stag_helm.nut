this.legend_helmet_stag_helm <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_stag_helm";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "The helm of a noble house champion bearing the design of the stag, unparralled craftmanship but quite unweildy.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 5000;
		this.m.Condition = 200;
		this.m.ConditionMax = 200;
		this.m.StaminaModifier = -15;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
		this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_stag_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_stag_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_stag_helm" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_stag_helm" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(2, 3) * -1;
		this.m.StaminaModifier = this.Math.rand(14, 16) * -1;
		this.m.Condition = this.Math.rand(200, 225);
		this.m.ConditionMax = this.m.Condition;
	}

});

