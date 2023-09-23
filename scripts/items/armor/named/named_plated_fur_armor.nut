this.named_plated_fur_armor <- this.inherit("scripts/items/armor/named/named_armor", {
	m = {},
	function create()
	{
		this.named_armor.create();
		this.m.ID = "armor.body.named_plated_fur_armor";
		this.m.Description = "A simple fur and leather armor with thick layers of metal plates rivetted ontop. A very simple and heavy design, but quite effective in combat.";
		this.m.NameList = [
			"Plated Fur Armor",
			"Plate Harness",
			"Plate-covered Hide",
			"Rivetted Fur"
		];
		this.m.PrefixList = this.Const.Strings.BarbarianPrefix;
		this.m.UseRandomName = false;
		this.m.Variant = 104;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4000;
		this.m.Condition = 155;
		this.m.ConditionMax = 155;
		this.m.StaminaModifier = -17;
		this.randomizeValues();
	}

});

