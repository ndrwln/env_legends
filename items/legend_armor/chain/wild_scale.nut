this.wild_scale <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.wild_scale";
		this.m.Name = "Wild Scale";
		this.m.Description = "A well crafted scale mail shirt";
		this.m.ArmorDescription = "Includes a basic mail shirt that offers good protection against slashing and piercing attacks.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 2000;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -6;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_wild_scale" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_wild_scale" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_wild_scale" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_wild_scale" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_wild_scale" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_wild_scale" + "_" + variant + ".png";
	}

});

