this.legend_armor_reinforced_worn_mail_shirt <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_reinforced_worn_mail_shirt";
		this.m.Name = "Worn Reinforced Mail Shirt";
		this.m.Description = "A reinforced mail shirt that lost some parts over the years.";
		this.m.ArmorDescription = "Includes a reinforced mail shirt that has seen better days.";
		this.m.Variants = [
			1,
			2,
			3,
			4
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 350;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -11;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_reinforced_worn_mail_shirt" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_reinforced_worn_mail_shirt" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_reinforced_worn_mail_shirt" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_reinforced_worn_mail_shirt" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_reinforced_worn_mail_shirt" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_reinforced_worn_mail_shirt" + "_" + variant + ".png";
	}

});

