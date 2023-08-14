this.goblin_skirmisher_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		local variants = [
			1,
			2,
			3,
			4,
			5,
			10,
			11,
			12,
			13,
			14
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];

		if (this.m.Variant == 5)
		{
			local subV = [
				5,
				6,
				7,
				8,
				9
			];
			this.m.Variant = subV[this.Math.rand(0, subV.len() - 1)];
		}

		this.updateVariant();
		this.m.ID = "armor.head.goblin_skirmisher_helmet";
		this.m.Name = "Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 25;
		this.m.ConditionMax = 25;
		this.m.StaminaModifier = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_goblin_04_helmet_" + variant;
		this.m.SpriteDamaged = "bust_goblin_04_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_goblin_04_helmet_" + variant + "_dead";
	}

});

