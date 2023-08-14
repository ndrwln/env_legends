this.legend_helmet_southern_open_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_southern_open_hood";
		this.m.Name = "Southern Hood";
		this.m.Description = "A southern hood made of cloth that wraps around the head.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 90;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_southern_open_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_southern_open_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_southern_open_hood" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_southern_open_hood" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
	}

});

