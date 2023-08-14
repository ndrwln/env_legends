this.goblin_spear <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.goblin_spear";
		this.m.Name = "Goblin Skewer";
		this.m.Description = "A long shaft with a sharp metal blade at the top.";
		this.m.IconLarge = "weapons/melee/goblin_weapon_03.png";
		this.m.Icon = "weapons/melee/goblin_weapon_03_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Spear;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Defensive;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_goblin_weapon_03";
		this.m.Value = 500;
		this.m.Condition = 36.0;
		this.m.ConditionMax = 36.0;
		this.m.StaminaModifier = -6;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.7;
		this.m.DirectDamageMult = 0.25;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local p = this.new("scripts/skills/actives/legend_glaive_slash");
		this.addSkill(p);
		local spearwall = this.new("scripts/skills/actives/spearwall");
		spearwall.m.BaseAttackName = p.getName();
		this.addSkill(spearwall);
	}

});

