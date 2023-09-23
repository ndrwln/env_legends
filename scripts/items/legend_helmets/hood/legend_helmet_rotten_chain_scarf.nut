this.legend_helmet_rotten_chain_scarf <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_rotten_chain_scarf";
		this.m.Name = "Rotten Aventail";
		this.m.Description = "A rotten mail aventail that extends from below the eyeline to cover the neck.";
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
		this.m.Value = 80;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -3;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rotten_chain_scarf" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_rotten_chain_scarf" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rotten_chain_scarf" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rotten_chain_scarf" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

