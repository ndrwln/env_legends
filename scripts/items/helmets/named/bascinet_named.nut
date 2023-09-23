this.bascinet_named <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.bascinet_named";
		this.m.Name = "Blackened Bascinet";
		this.m.Description = "A strong bascinet, with mail aventail and gilded visor. Offers great protection as well as excellent style.";
		this.m.NameList = [
			"Gilded Shield",
			"Final Stockade",
			"Angel\'s Plea",
			"Bright Disparity",
			"Voice Muffler"
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
		this.m.Condition = 340;
		this.m.ConditionMax = 365;
		this.m.StaminaModifier = -28;
		this.m.Vision = -3;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.Sprite = "named_bascinet_01";
		this.m.SpriteDamaged = "named_bascinet_01_damaged";
		this.m.SpriteCorpse = "named_bascinet_01_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_named_bascinet_01.png";
	}

});

