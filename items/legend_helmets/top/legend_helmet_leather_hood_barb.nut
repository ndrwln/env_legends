this.legend_helmet_leather_hood_barb <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_leather_hood_barb";
		this.m.Name = "Leather Hood Barb";
		this.m.Description = "The crude padded leather hood of a barbarian, it is heavy and surprisingly protective.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 300;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -4;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_leather_hood_barb" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_leather_hood_barb" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_leather_hood_barb" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_leather_hood_barb" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

