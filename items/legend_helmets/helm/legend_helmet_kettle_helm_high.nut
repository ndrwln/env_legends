this.legend_helmet_kettle_helm_high <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_kettle_helm_high";
		this.m.Name = "Hardened Kettle Helm";
		this.m.Description = "A hardended full-metal helmet with a broad rim, excellent quality and military grade.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 850;
		this.m.Condition = 125;
		this.m.ConditionMax = 125;
		this.m.StaminaModifier = -9;
		this.m.Vision = -1;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_kettle_helm_high" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_kettle_helm_high" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_kettle_helm_high" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_kettle_helm_high" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

