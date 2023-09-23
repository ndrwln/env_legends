this.black_leather_armor <- this.inherit("scripts/items/armor/named/named_armor", {
	m = {},
	function create()
	{
		this.named_armor.create();
		this.m.ID = "armor.body.black_leather";
		this.m.Description = "A well-crafted and hardened leather armor supported by a padded gambeson and chainmail. Light to wear but very sturdy.";
		this.m.NameList = [
			"Leather Cuirass",
			"Mail Shirt",
			"Leather Armor",
			"Skin",
			"Peel",
			"Guard",
			"Coat",
			"Nightcloak",
			"Black",
			"Dark Omen"
		];
		this.m.Variant = 42;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 2000;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -12;
		this.randomizeValues();
	}

});

