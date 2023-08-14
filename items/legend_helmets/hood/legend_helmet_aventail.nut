this.legend_helmet_aventail <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_aventail";
		this.m.Name = "Aventail";
		this.m.Description = "A mail aventail that extends from below the eyeline to cover the neck and lower face.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 150;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -3;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_aventail" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_aventail" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_aventail" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_aventail" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

