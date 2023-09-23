this.legend_helmet_leather_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_leather_hood";
		this.m.Name = "Leather Hood";
		this.m.Description = "A closed leather cap that protects the head and neck. Padded for extra protection.";
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
		this.m.Value = 110;
		this.m.Condition = 45;
		this.m.ConditionMax = 45;
		this.m.StaminaModifier = -2;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_leather_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_leather_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_leather_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_leather_hood" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

