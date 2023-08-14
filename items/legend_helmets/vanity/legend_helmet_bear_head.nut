this.legend_helmet_bear_head <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_bear_head";
		this.m.Name = "Bear Headpiece";
		this.m.Description = "The dried and prepped head of a large bear. Offers some protection, but is mostly donned for the looks.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 50;
		this.m.Condition = 8;
		this.m.ConditionMax = 8;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_bear_head" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_bear_head" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_bear_head" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_bear_head" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

