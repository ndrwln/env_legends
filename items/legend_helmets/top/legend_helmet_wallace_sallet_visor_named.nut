this.legend_helmet_wallace_sallet_visor_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_wallace_sallet_visor_named";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "This visor bears an exquisite caricature of a beast\'s face on the front, putting terror into any who gaze upon it.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 700;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -1;
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
		this.m.Sprite = "legendhelms_wallace_sallet_visor_named" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_wallace_sallet_visor_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_wallace_sallet_visor_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_wallace_sallet_visor_named" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(1, 1) * -1;
		this.m.StaminaModifier = this.Math.rand(1, 2) * -1;
		this.m.Condition = this.Math.rand(35, 50);
		this.m.ConditionMax = this.m.Condition;
	}

});

