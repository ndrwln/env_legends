this.legend_helmet_southern_headband_coin <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_southern_headband_coin";
		this.m.Name = "Southern Coin Headband";
		this.m.Description = "A southern headband of coins strung together.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 20;
		this.m.Condition = 5;
		this.m.ConditionMax = 5;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_southern_headband_coin" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_southern_headband_coin" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_southern_headband_coin" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_southern_headband_coin" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

