this.named_skull_and_chain_armor <- this.inherit("scripts/items/armor/named/named_armor", {
	m = {},
	function create()
	{
		this.named_armor.create();
		this.m.ID = "armor.body.named_skull_and_chain_armor";
		this.m.Description = "A barbarian armor of crude making that has been adjusted to protect without being too cumbersome. It wears the typical markings of the northern barbarian tribes.";
		this.m.NameList = [
			"Tribal Hide",
			"Barbarian Coat",
			"Scavenged Armor",
			"Barbarian Pelt",
			"Primitive Harness"
		];
		this.m.PrefixList = this.Const.Strings.BarbarianPrefix;
		this.m.UseRandomName = false;
		this.m.Variant = 102;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 5500;
		this.m.Condition = 210;
		this.m.ConditionMax = 210;
		this.m.StaminaModifier = -27;
		this.randomizeValues();
	}

});

