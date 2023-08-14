this.legend_helmet_faceplate_full_01_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_faceplate_full_01_named";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "An exceptionally well crafted faceplate of high worksmanship.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1,
			2,
			3
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 2000;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -6;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
		this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_faceplate_full_01_named" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_faceplate_full_01_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_faceplate_full_01_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_faceplate_full_01_named" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(1, 2) * -1;
		this.m.StaminaModifier = this.Math.rand(5, 6) * -1;
		this.m.Condition = this.Math.rand(75, 100);
		this.m.ConditionMax = this.m.Condition;
	}

});

