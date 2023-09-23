this.goblin_heavy_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.Variant = this.Math.rand(20, 26);
		this.updateVariant();
		this.m.ID = "armor.head.goblin_heavy_helmet";
		this.m.Name = "Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Condition = 90;
		this.m.ConditionMax = 90;
		this.m.StaminaModifier = -4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_goblin_02_helmet_" + variant;
		this.m.SpriteDamaged = "bust_goblin_02_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_goblin_02_helmet_" + variant + "_dead";
	}

});

