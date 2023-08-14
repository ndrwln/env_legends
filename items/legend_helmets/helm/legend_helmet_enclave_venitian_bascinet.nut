this.legend_helmet_enclave_venitian_bascinet <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_enclave_venitian_bascinet";
		this.m.Name = "Great Bascinet";
		this.m.Description = "A tall helm composed of a peaked bascinet and riveted cheek protection.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 3000;
		this.m.Condition = 185;
		this.m.ConditionMax = 185;
		this.m.StaminaModifier = -14;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_enclave_venitian_bascinet" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_enclave_venitian_bascinet" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_enclave_venitian_bascinet" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_enclave_venitian_bascinet" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

