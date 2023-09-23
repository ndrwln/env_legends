this.orc_elite_heavy_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.updateVariant();
		this.m.ID = "armor.head.orc_elite_heavy_helmet";
		this.m.Name = "Bloody Metal Plate Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 540;
		this.m.ConditionMax = 540;
		this.m.StaminaModifier = -35;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_orc_elite_helmet_01";
		this.m.SpriteDamaged = "bust_orc_elite_helmet_01_damaged";
		this.m.SpriteCorpse = "bust_orc_elite_helmet_01_dead";
	}

});

