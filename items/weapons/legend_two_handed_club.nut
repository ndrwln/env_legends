this.legend_two_handed_club <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_two_handed_club";
		this.m.Name = "Two-Handed Club";
		this.m.Description = "A massive wooden club with a spiked head. Receiving a blow from this weapon will leave anyone dazed and gasping for air.";
		this.m.IconLarge = "weapons/melee/legend_two_handed_club_01.png";
		this.m.Icon = "weapons/melee/legend_two_handed_club_01_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Mace;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_two_handed_club_01";
		this.m.Value = 400;
		this.m.ShieldDamage = 20;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -12;
		this.m.RegularDamage = 35;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.5;
		this.m.DirectDamageAdd = -0.05;
		this.m.ChanceToHitHead = 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/cudgel_skill");
		skill.m.Icon = "skills/active_131.png";
		skill.m.IconDisabled = "skills/active_131_sw.png";
		skill.m.Overlay = "active_131";
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/strike_down_skill");
		skill.m.Icon = "skills/active_132.png";
		skill.m.IconDisabled = "skills/active_132_sw.png";
		skill.m.Overlay = "active_132";
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/split_shield");
		skill.setFatigueCost(skill.getFatigueCostRaw() + 5);
		this.addSkill(skill);
	}

});

