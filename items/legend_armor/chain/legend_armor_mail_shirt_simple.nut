this.legend_armor_mail_shirt_simple <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_mail_shirt_simple";
		this.m.Name = "Simple Mail Shirt";
		this.m.Description = "A simple mail shirt. Offers decent and affordable protection against slashing and piercing attacks.";
		this.m.ArmorDescription = "Includes a simple mail shirt that offers good protection against slashing and piercing attacks.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 250;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = -3;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_mail_shirt_simple" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_mail_shirt_simple" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_mail_shirt_simple" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_mail_shirt_simple" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_mail_shirt_simple" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_mail_shirt_simple" + "_" + variant + ".png";
	}

});

