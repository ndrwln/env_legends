this.legend_armor_leather_brigandine_hardened <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_armor_leather_brigandine_hardened";
		this.m.Name = "Hardened Leather Brigandine Armor";
		this.m.Description = "A boiled and hardened leather brigandine studded with steel rivets for added protection.";
		this.m.ArmorDescription = "Includes leather brigandine armor.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 1250;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -15;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_brigandine_hardened" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_brigandine_hardened" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_brigandine_hardened" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_legend_leather_brigandine_hardened" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_legend_leather_brigandine_hardened" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_legend_leather_brigandine_hardened" + "_" + variant + ".png";
	}

});

