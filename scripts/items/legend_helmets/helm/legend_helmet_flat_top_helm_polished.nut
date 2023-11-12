this.legend_helmet_flat_top_helm_polished <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_flat_top_helm_polished";
		this.m.Name = "Hardened Flat Top Helm";
		this.m.Description = "An outstandingly well made and maintained flat full-metal helmet with noseguard.";
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
		this.m.Value = 550;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -5;
		this.m.Vision = -1;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_flat_top_helm_polished" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_flat_top_helm_polished" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_flat_top_helm_polished" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_flat_top_helm_polished" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

