this.legend_crusader_sword <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 15
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_crusader_sword";
		this.m.Name = "Crusader Sword";
		this.m.Description = "A two-handed holy sword. Almost perfectly balanced and honed, it has no equal as it hunts the heads of the wicked.";
		this.m.IconLarge = "weapons/melee/legend_crusader_sword_01.png";
		this.m.Icon = "weapons/melee/legend_crusader_sword_01_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Sword;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = false;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_crusader_sword_01";
		this.m.Value = 2400;
		this.m.ShieldDamage = 12;
		this.m.Condition = 62.0;
		this.m.ConditionMax = 62.0;
		this.m.StaminaModifier = -8;
		this.m.RegularDamage = 60;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 0.8;
		this.m.DirectDamageMult = 0.25;
		this.m.ChanceToHitHead = 10;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skillToAdd = this.new("scripts/skills/actives/overhead_strike");
		skillToAdd.setStunChance(this.m.StunChance);
		this.addSkill(skillToAdd);
		this.addSkill(this.new("scripts/skills/actives/slash"));
		this.addSkill(this.new("scripts/skills/actives/swing"));
		this.addSkill(this.new("scripts/skills/actives/riposte"));
	}

});

