this.legend_helmet_mail_coif <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_mail_coif";
		this.m.Name = "Heavy Mail Coif";
		this.m.Description = "A full mail coif, heavier and sturdier than most others of its kind.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 450;
		this.m.Condition = 85;
		this.m.ConditionMax = 85;
		this.m.StaminaModifier = -5;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_mail_coif" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_mail_coif" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_mail_coif" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_mail_coif" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

