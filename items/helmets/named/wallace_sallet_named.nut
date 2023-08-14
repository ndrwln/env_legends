this.wallace_sallet_named <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.wallace_sallet_named";
		this.m.Name = "Decorated Sallet";
		this.m.Description = "An exquisitely decorated sallet atop a mail coif. This sallet has a beast\'s face painted upon it\'s sturdy metal visor.";
		this.m.NameList = [
			"House Cat",
			"Hunter Of Prey",
			"Mask Of The Beast",
			"Hungry Eyes",
			"Lion\'s Maw"
		];
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.IsDroppedAsLoot = true;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4000;
		this.m.Condition = 280;
		this.m.ConditionMax = 305;
		this.m.StaminaModifier = -20;
		this.m.Vision = -2;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.Sprite = "wallace_sallet_named_01";
		this.m.SpriteDamaged = "wallace_sallet_named_01_damaged";
		this.m.SpriteCorpse = "wallace_sallet_named_01_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_wallace_sallet_named_01.png";
	}

});

