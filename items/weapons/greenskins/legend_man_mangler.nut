this.legend_man_mangler <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 0
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.legend_man_mangler";
		this.m.Name = "Man Mangler";
		this.m.Description = "A massive, crudely sharpened shard of metal that makes up for its stunted length through sheer weight. So heavy no average human can use it effectively. Attacks cost +5 fatigue per use";
		this.m.IconLarge = "weapons/melee/legend_man_mangler_01.png";
		this.m.Icon = "weapons/melee/legend_man_mangler_01_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Sword;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsDoubleGrippable = false;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_legend_man_mangler_01";
		this.m.Value = 1600;
		this.m.ShieldDamage = 32;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -26;
		this.m.RegularDamage = 60;
		this.m.RegularDamageMax = 95;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.35;
		this.m.ChanceToHitHead = 5;
		this.m.FatigueOnSkillUse = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local overheadStrike = this.new("scripts/skills/actives/overhead_strike");
		overheadStrike.m.DirectDamageMult = this.m.DirectDamageMult;
		overheadStrike.setStunChance(this.m.StunChance);
		this.addSkill(overheadStrike);
		local slash = this.new("scripts/skills/actives/legend_great_slash");
		slash.m.DirectDamageMult = this.m.DirectDamageMult;
		this.addSkill(slash);
		local splitShield = this.new("scripts/skills/actives/split_shield");
		splitShield.setFatigueCost(splitShield.getFatigueCostRaw() + 10);
		this.addSkill(splitShield);
	}

});

