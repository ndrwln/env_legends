this.legend_helmet_rusty_chain_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_rusty_chain_hood";
		this.m.Name = "Rusty Mail Coif";
		this.m.Description = "A rusty mail coif that still offers good protection - it leaves horrible stains though.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 150;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -4;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_rusty_chain_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_rusty_chain_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_rusty_chain_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_rusty_chain_hood" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

