this.barbute_named <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.barbute_named";
		this.m.Name = "Blackened Barbute";
		this.m.Description = "A barbute atop a mail coif. It has been completely blackened and polished to a shine.";
		this.m.NameList = [
			"Murky Swing",
			"Knight Of Distant Lands",
			"Simply Effective",
			"Frederick\'s Horn",
			"Helm Of Jet"
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
		this.m.Condition = 300;
		this.m.ConditionMax = 325;
		this.m.StaminaModifier = -22;
		this.m.Vision = -2;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.Sprite = "barbute_named_01";
		this.m.SpriteDamaged = "barbute_named_01_damaged";
		this.m.SpriteCorpse = "barbute_named_01_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_barbute_named_01.png";
	}

});

