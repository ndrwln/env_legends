this.legend_southern_mail <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Chain;
		this.m.ID = "legend_armor.body.legend_southern_mail";
		this.m.Name = "Southern Mail";
		this.m.Description = "A long and heavy mail shirt of southern design made with with slightly thinner and lighter metal rings than those used in the north";
		this.m.ArmorDescription = "Includes a long southern mail shirt.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1400;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -13;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_southern_mail" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_southern_mail" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_southern_mail" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_southern_mail" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_southern_mail" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_southern_mail" + "_" + variant + ".png";
	}

});

