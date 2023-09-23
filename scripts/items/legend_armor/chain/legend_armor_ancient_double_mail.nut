this.legend_armor_ancient_double_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_armor_ancient_double_mail";
		this.m.Name = "Ancient Double Layer Mail";
		this.m.Description = "Includes A heavy and rotten double-layered mail of ancient design.";
		this.m.ArmorDescription = "";
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
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 750;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -14;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_ancient_double_mail" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_ancient_double_mail" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_ancient_double_mail" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_ancient_double_mail" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_ancient_double_mail" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_ancient_double_mail" + "_" + variant + ".png";
	}

});

