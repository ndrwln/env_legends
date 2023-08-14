this.named_undead_kite_shield <- this.inherit("scripts/items/shields/named/named_shield", {
	m = {},
	function create()
	{
		this.named_shield.create();
		this.m.Variants = [
			1,
			2,
			3
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ID = "shield.named_undead_kite_shield";
		this.m.NameList = this.Const.Strings.ShieldNames;
		this.m.Description = "An elongated wooden shield that offers good protection also to the lower body, despite its apparent age. Somewhat bulky to handle in close combat engagements.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 700;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 25;
		this.m.StaminaModifier = -13;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.Sprite = "shield_undead_02_named_0" + this.m.Variant;
		this.m.SpriteDamaged = "shield_undead_02_named_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "shield_undead_02_named_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_undead_shield_02_named_0" + this.m.Variant + ".png";
		this.m.Icon = "shields/icon_undead_shield_02_named_0" + this.m.Variant + ".png";
	}

	function onEquip()
	{
		this.named_shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

});

