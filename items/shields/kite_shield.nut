this.kite_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.kite_shield";
		this.m.Name = "Kite Shield";
		this.m.Description = "An elongated wooden shield covered in leather that offers good protection also to the lower body. Somewhat bulky to handle in close combat engagements.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			12,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20,
			21,
			22,
			23,
			24,
			25,
			26,
			27,
			28,
			29,
			30,
			31,
			32,
			33,
			34,
			35,
			36,
			37,
			38,
			39,
			40,
			41,
			42
		];
		this.m.Variant = this.Math.rand(0, 9);
		this.updateVariant();
		this.m.Value = 200;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 25;
		this.m.StaminaModifier = -16;
		this.m.Condition = 48;
		this.m.ConditionMax = 48;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.Sprite = "shield_kite_" + variant;
		this.m.SpriteDamaged = "shield_kite_" + variant + "_damaged";
		this.m.ShieldDecal = "shield_kite_" + variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_kite_shield_" + variant + ".png";
		this.m.Icon = "shields/icon_kite_shield_" + variant + ".png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

	function onPaintSpecificColor( _color )
	{
		this.setVariant(_color);
		this.updateAppearance();
	}

	function onPaintInCompanyColors()
	{
		this.setVariant(this.World.Assets.getBannerID() + 11);
		this.updateAppearance();
	}

});

