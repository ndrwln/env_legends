this.legend_helmet_enclave_bevor <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_enclave_bevor";
		this.m.Name = "Bevor";
		this.m.Description = "A solid metal bevor.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 750;
		this.m.Condition = 95;
		this.m.ConditionMax = 95;
		this.m.StaminaModifier = -7;
		this.m.Vision = 0;
		this.m.HideHair = false;
		this.m.HideBeard = true;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_enclave_bevor" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_enclave_bevor" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_enclave_bevor" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_enclave_bevor" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

