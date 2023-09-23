this.legend_helmet_simple_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_simple_hood";
		this.m.Name = "Simple Hood";
		this.m.Description = "A simple hood to protect against weather and scratches.";
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
		this.m.Value = 50;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_simple_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_simple_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_simple_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_simple_hood" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

