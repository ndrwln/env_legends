this.legend_helmet_rotten_great_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_rotten_great_helm";
		this.m.Name = "Rotten Great Helm";
		this.m.Description = "Rotten Great Helm.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1,
			2,
			3,
			4
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 750;
		this.m.Condition = 150;
		this.m.ConditionMax = 150;
		this.m.StaminaModifier = -14;
		this.m.Vision = -3;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rotten_great_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_rotten_great_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rotten_great_helm" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rotten_great_helm" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

