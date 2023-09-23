this.legend_helmet_heavy_plate_helm_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_heavy_plate_helm_named";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "This heavy helmet has ornamental horns attached and is of exceptional quality among the barbarian clans. This is a sign of high standing and reputation within barbarian warbands.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 3500;
		this.m.Condition = 185;
		this.m.ConditionMax = 185;
		this.m.StaminaModifier = -14;
		this.m.Vision = -3;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
		this.randomizeValues();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_heavy_plate_helm_named" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_heavy_plate_helm_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_heavy_plate_helm_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_heavy_plate_helm_named" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(2, 3) * -1;
		this.m.StaminaModifier = this.Math.rand(12, 14) * -1;
		this.m.Condition = this.Math.rand(185, 205);
		this.m.ConditionMax = this.m.Condition;
	}

});

