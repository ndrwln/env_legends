this.legend_helmet_barbute_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_barbute_named";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "A superb barbute helmet of foreign origin, this helmet has been blackened and polished to a dark shine. ";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 2750;
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -4;
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
		this.m.Sprite = "legendhelms_barbute_named" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_barbute_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_barbute_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_barbute_named" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(1, 2) * -1;
		this.m.StaminaModifier = this.Math.rand(2, 4) * -1;
		this.m.Condition = this.Math.rand(85, 105);
		this.m.ConditionMax = this.m.Condition;
	}

});

