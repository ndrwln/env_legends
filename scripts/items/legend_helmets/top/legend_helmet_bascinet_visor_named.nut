this.legend_helmet_bascinet_visor_named <- this.inherit("scripts/items/legend_helmets/legend_named_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_named_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_bascinet_visor_named";
		this.m.NameList = this.Const.Strings.LegendArmorLayers;
		this.m.Description = "A gilded visor with a pointed snout and plenty of holes to breathe through.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1000;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -2;
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
		this.m.Sprite = "legendhelms_bascinet_visor_named" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_bascinet_visor_named" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_bascinet_visor_named" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_bascinet_visor_named" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

	function randomizeValues()
	{
		this.m.Vision = this.Math.rand(1, 1) * -1;
		this.m.StaminaModifier = this.Math.rand(2, 3) * -1;
		this.m.Condition = this.Math.rand(50, 70);
		this.m.ConditionMax = this.m.Condition;
	}

});

