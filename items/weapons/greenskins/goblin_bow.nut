this.goblin_bow <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.goblin_bow";
		this.m.Name = "Boondock Bow";
		this.m.Description = "A very light short bow used by Goblins.";
		this.m.IconLarge = "weapons/ranged/bow_goblin_01.png";
		this.m.Icon = "weapons/ranged/bow_goblin_01_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Bow;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_goblin_bow_01";
		this.m.Value = 250;
		this.m.Condition = 52.0;
		this.m.ConditionMax = 52.0;
		this.m.StaminaModifier = -3;
		this.m.RangeMin = 2;
		this.m.RangeMax = 6;
		this.m.RangeIdeal = 6;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.55;
		this.m.DirectDamageMult = 0.35;
	}

	function getAmmoID()
	{
		return "ammo.arrows";
	}

	function getAdditionalRange( _actor )
	{
		return _actor.getCurrentProperties().IsSpecializedInBows ? 1 : 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/quick_shot"));
		this.addSkill(this.new("scripts/skills/actives/aimed_shot"));
		this.addSkill(this.new("scripts/skills/actives/legend_piercing_shot"));
		this.addSkill(this.new("scripts/skills/actives/legend_cascade_skill"));
	}

});

