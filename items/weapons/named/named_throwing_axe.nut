this.named_throwing_axe <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function isAmountShown()
	{
		return true;
	}

	function getAmountString()
	{
		return this.m.Ammo + "/" + this.m.AmmoMax;
	}

	function create()
	{
		this.named_weapon.create();
		this.m.Ammo = 5;
		this.m.AmmoMax = 5;
		this.m.Variants = [
			1,
			2,
			3
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ID = "weapon.named_throwing_axe";
		this.m.NameList = this.Const.Strings.ThrowingAxeNames;
		this.m.Description = "Small axes to be thrown in an overhand motion towards a target. These ones are especially well-balanced and hardy enough to inflict serious damage to armor and shields from range.";
		this.m.WeaponType = this.Const.Items.WeaponType.Throwing;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.OneHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 1400;
		this.m.RangeMin = 2;
		this.m.RangeMax = 4;
		this.m.RangeIdeal = 4;
		this.m.StaminaModifier = -4;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 1.3;
		this.m.DirectDamageMult = 0.25;
		this.m.ShieldDamage = 0;
		this.m.ChanceToHitHead = 5;
		this.randomizeValues();
	}

	function updateVariant()
	{
		if (this.m.Ammo > 0)
		{
			this.m.IconLarge = "weapons/melee/throwing_axes_01_named_0" + this.m.Variant + ".png";
			this.m.Icon = "weapons/melee/throwing_axes_01_named_0" + this.m.Variant + "_70x70.png";
			this.m.ArmamentIcon = "icon_named_throwing_axes_0" + this.m.Variant;
			this.m.ShowArmamentIcon = true;
		}
		else
		{
			this.m.IconLarge = "weapons/ranged/throwing_axes_01_bag.png";
			this.m.Icon = "weapons/ranged/throwing_axes_01_bag_70x70.png";
			this.m.ArmamentIcon = "icon_named_throwing_axes_0" + this.m.Variant;
			this.m.ShowArmamentIcon = false;
		}
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/throw_axe"));
	}

	function setAmmo( _a )
	{
		this.named_weapon.setAmmo(_a);
		this.updateVariant();
		this.updateAppearance();
	}

});

