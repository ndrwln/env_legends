this.wooden_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.wooden_shield";
		this.m.Name = "Wooden Shield";
		this.m.Description = "A round wooden shield.";
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
			11,
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
			41
		];
		this.m.Variant = this.Math.rand(0, 9);
		this.updateVariant();
		this.m.Value = 100;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 15;
		this.m.StaminaModifier = -10;
		this.m.Condition = 24;
		this.m.ConditionMax = 24;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.Sprite = "shield_round_" + variant;
		this.m.SpriteDamaged = "shield_round_" + variant + "_damaged";
		this.m.ShieldDecal = "shield_round_" + variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_shield_round_" + variant + ".png";
		this.m.Icon = "shields/icon_shield_round_" + variant + ".png";
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
		this.logInfo("banner id: " + this.World.Assets.getBanner().slice(this.World.Assets.getBanner().find("_") + 1).tointeger());
		this.setVariant(this.World.Assets.getBannerID() + 10);
		this.updateAppearance();
	}

});

