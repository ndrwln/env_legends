this.wonky_bow <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.wonky_bow";
		this.m.Name = "Wonky Bow";
		this.m.Description = "An ill-conceived bow if you ever saw one. The wood cricks and cracks when bent, the string frizzes and goes wiry every time you draw it back.";
		this.m.IconLarge = "weapons/ranged/bow_04.png";
		this.m.Icon = "weapons/ranged/bow_04_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Bow;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_event_bow_02";
		this.m.Value = 100;
		this.m.RangeMin = 2;
		this.m.RangeMax = 7;
		this.m.RangeIdeal = 7;
		this.m.StaminaModifier = -6;
		this.m.Condition = 48.0;
		this.m.ConditionMax = 48.0;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 50;
		this.m.ArmorDamageMult = 0.5;
		this.m.DirectDamageMult = 0.35;
		this.m.AdditionalAccuracy = -10;
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

	function onSerialize( _out )
	{
		this.weapon.onSerialize(_out);
		_out.writeString(this.m.Name);
	}

	function onDeserialize( _in )
	{
		this.weapon.onDeserialize(_in);
		this.m.Name = _in.readString();
	}

});

