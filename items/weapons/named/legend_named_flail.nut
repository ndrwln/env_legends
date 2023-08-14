this.legend_named_flail <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.ID = "weapon.legend_named_flail";
		this.m.NameList = this.Const.Strings.TwoHandedFlailNames;
		this.m.Description = "A metal weight attached with a short chain to a long pole, the War Flail is a brutal weapon. Deadly enough to fell most men with a good hit to the head, and useful to strike over or around shield cover.";
		this.m.IconLarge = "weapons/melee/legend_flail_ranged_02_named_01.png";
		this.m.Icon = "weapons/melee/legend_flail_ranged_02_named_01_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Flail;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Cultist;
		this.m.IsAgainstShields = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_flail_ranged_02_named_01";
		this.m.Value = 3000;
		this.m.ShieldDamage = 0;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -10;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 80;
		this.m.ArmorDamageMult = 1.0;
		this.m.ChanceToHitHead = 10;
		this.m.DirectDamageMult = 0.3;
		this.randomizeValues();
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_ranged_flail_skill"));
		this.addSkill(this.new("scripts/skills/actives/legend_ranged_lash_skill"));
	}

});

