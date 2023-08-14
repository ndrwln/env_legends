this.legend_helmet_rotten_flat_top_face_mask <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Helm;
		this.m.ID = "armor.head.legend_helmet_rotten_flat_top_face_mask";
		this.m.Name = "Rotten Flat Top Face Mask";
		this.m.Description = "Rotten Flat Top Face Mask.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 400;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -8;
		this.m.Vision = -2;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rotten_flat_top_face_mask" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_rotten_flat_top_face_mask" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rotten_flat_top_face_mask" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rotten_flat_top_face_mask" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

