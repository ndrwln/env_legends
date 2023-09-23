this.goblin_light_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.Variant = this.Math.rand(4, 20);
		this.updateVariant();
		this.m.ID = "armor.head.goblin_light_helmet";
		this.m.Name = "Light Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -2;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_goblin_01_helmet_" + variant;
		this.m.SpriteDamaged = "bust_goblin_01_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_goblin_01_helmet_" + variant + "_dead";
	}

	function onUpdateProperties( _properties )
	{
		this.helmet.onUpdateProperties(_properties);
		_properties.IsAffectedByRain = false;
	}

});

