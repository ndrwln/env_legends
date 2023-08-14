this.legend_helmet_chain_hood_full <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_chain_hood_full";
		this.m.Name = "Full Mail Coif";
		this.m.Description = "A mail coif that also protects the neck.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 400;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_chain_hood_full" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_chain_hood_full" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_chain_hood_full" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_chain_hood_full" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

