this.legend_helmet_orc_elite_double_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_orc_elite_double_helm";
		this.m.Name = "Orc Reinforced Looted Kettle Hat";
		this.m.Description = "An orc helm made from two kettle hats tied together and reinforced with additional chain. Craftsmanship is exceptional for orc armor.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1500;
		this.m.Condition = 225;
		this.m.ConditionMax = 225;
		this.m.StaminaModifier = -25;
		this.m.Vision = -3;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_orc_elite_double_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_orc_elite_double_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_orc_elite_double_helm" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_orc_elite_double_helm" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

