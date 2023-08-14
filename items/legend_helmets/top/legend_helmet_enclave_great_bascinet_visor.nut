this.legend_helmet_enclave_great_bascinet_visor <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_enclave_great_bascinet_visor";
		this.m.Name = "Great Bascinet Visor";
		this.m.Description = "Visor made for the great bascinet. Provides much protection to the wearer\'s face, but limits vision.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 900;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -6;
		this.m.Vision = -1;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_enclave_great_bascinet_visor" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_enclave_great_bascinet_visor" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_enclave_great_bascinet_visor" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_enclave_great_bascinet_visor" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

