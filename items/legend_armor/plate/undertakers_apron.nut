this.undertakers_apron <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.undertakers_apron";
		this.m.Name = "Undertakers Apron";
		this.m.Description = "A leather apron usually worn by an undertaker";
		this.m.ArmorDescription = "";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 60;
		this.m.Condition = 35;
		this.m.ConditionMax = 35;
		this.m.StaminaModifier = -4;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_undertakers_apron" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_undertakers_apron" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_undertakers_apron" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/icon_undertakers_apron" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/icon_undertakers_apron" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/inventory_undertakers_apron" + "_" + variant + ".png";
	}

});

