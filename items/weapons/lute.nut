this.lute <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.lute";
		this.m.Name = "Lute";
		this.m.Description = "A musical instrument that, if in the right hands, is capable of producing pleasant sounds with its vibrating strings.";
		this.m.IconLarge = "weapons/melee/lute_01.png";
		this.m.Icon = "weapons/melee/lute_01_70x70.png";
		this.m.BreakingSound = "sounds/combat/lute_break_01.wav";
		this.m.WeaponType = this.Const.Items.WeaponType.Musical | this.Const.Items.WeaponType.Mace;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_lute";
		this.m.Value = 50;
		this.m.Condition = 30.0;
		this.m.ConditionMax = 30.0;
		this.m.StaminaModifier = -2;
		this.m.RegularDamage = 5;
		this.m.RegularDamageMax = 20;
		this.m.ArmorDamageMult = 0.1;
		this.m.DirectDamageMult = 0.4;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/lute_bash"));
		local s = this.new("scripts/skills/actives/knock_out");
		s.m.IsFromLute = true;
		s.m.Icon = "skills/active_88.png";
		s.m.IconDisabled = "skills/active_88_sw.png";
		s.m.Overlay = "active_88";
		this.addSkill(s);
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

