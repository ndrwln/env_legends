this.heater_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.heater_shield";
		this.m.Name = "Heater Shield";
		this.m.Description = "A triangular wooden shield covered with leather and canvas.";
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
			10,
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
			41,
			42
		];
		this.m.Variant = this.Math.rand(1, 11);
		this.updateVariant();
		this.m.Value = 250;
		this.m.MeleeDefense = 20;
		this.m.RangedDefense = 15;
		this.m.StaminaModifier = -14;
		this.m.Condition = 32;
		this.m.ConditionMax = 32;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.Sprite = "shield_heater_" + variant;
		this.m.SpriteDamaged = "shield_heater_" + variant + "_damaged";
		this.m.ShieldDecal = "shield_heater_" + variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_heater_shield_" + variant + ".png";
		this.m.Icon = "shields/icon_heater_shield_" + variant + ".png";
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

