this.legend_helmet_cult_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Top;
		this.m.ID = "armor.head.legend_helmet_cult_hood";
		this.m.Name = "Cult Leather Hood";
		this.m.Description = "A leather hood used in cultist ceremonies.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 60;
		this.m.Condition = 15;
		this.m.ConditionMax = 15;
		this.m.StaminaModifier = -1;
		this.m.Vision = -1;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_cult_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_cult_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_cult_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_cult_hood" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

