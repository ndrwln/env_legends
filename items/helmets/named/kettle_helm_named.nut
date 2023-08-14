this.kettle_helm_named <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.kettle_helm_named";
		this.m.Name = "Blackened Kettle Helm";
		this.m.Description = "A sturdy kettle helm atop a chain coif. This helmet has been blackened as well as gilded at it\'s peak.";
		this.m.NameList = [
			"Gaze Stealer",
			"Gunner\'s Basket",
			"Helm Of The Lone Guardsman",
			"Dignified Onyx",
			"Cast Iron Pot"
		];
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.IsDroppedAsLoot = true;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4000;
		this.m.Condition = 190;
		this.m.ConditionMax = 215;
		this.m.StaminaModifier = -13;
		this.m.Vision = -1;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.Sprite = "kettle_helm_named_01";
		this.m.SpriteDamaged = "kettle_helm_named_01_damaged";
		this.m.SpriteCorpse = "kettle_helm_named_01_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_kettle_helm_named_01.png";
	}

});

