this.italo_norman_helm_named <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.italo_norman_helm_named";
		this.m.Name = "Decorated Italo Norman Helm";
		this.m.Description = "A conic helmet with a bill shaped visor attached. This one has lengths of gilded steel woven into the top skullcap.";
		this.m.NameList = [
			"Golden Goose",
			"Cliff Breaker",
			"Steel Pavise",
			"Bird Of Prey",
			"Arrow Catcher"
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
		this.m.Sprite = "italo_norman_helm_named_01";
		this.m.SpriteDamaged = "italo_norman_helm_named_01_damaged";
		this.m.SpriteCorpse = "italo_norman_helm_named_01_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/italo_norman_helm_named_01.png";
	}

});

