this.named_crossbow <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {
		IsLoaded = true
	},
	function isLoaded()
	{
		return this.m.IsLoaded;
	}

	function setLoaded( _l )
	{
		this.m.IsLoaded = _l;
	}

	function create()
	{
		this.named_weapon.create();
		this.m.Variant = this.Math.rand(1, 3);
		this.updateVariant();
		this.m.ID = "weapon.named_crossbow";
		this.m.NameList = this.Const.Strings.CrossbowNames;
		this.m.Description = "A pull-lever crossbow that can propel bolts over medium distances. Effective even in the hands of laymen, but requires almost a full turn to reload. Well balanced and with extraordinarily strong sinews, this weapon is truly the work of a master craftsman.";
		this.m.WeaponType = this.Const.Items.WeaponType.Crossbow;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.TwoHanded;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 4400;
		this.m.RangeMin = 1;
		this.m.RangeMax = 6;
		this.m.RangeIdeal = 6;
		this.m.StaminaModifier = -12;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 70;
		this.m.ArmorDamageMult = 0.75;
		this.m.DirectDamageMult = 0.5;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/ranged/crossbow_01_named_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/ranged/crossbow_01_named_0" + this.m.Variant + "_70x70.png";
		this.m.ArmamentIcon = "icon_named_crossbow_0" + this.m.Variant;
	}

	function getAmmoID()
	{
		return "ammo.bolts";
	}

	function getTooltip()
	{
		local result = this.named_weapon.getTooltip();

		if (!this.m.IsLoaded)
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Must be reloaded before firing again[/color]"
			});
		}

		return result;
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shoot_bolt"));
		this.addSkill(this.new("scripts/skills/actives/legend_piercing_bolt"));

		if (!this.m.IsLoaded)
		{
			this.addSkill(this.new("scripts/skills/actives/reload_bolt"));
		}
	}

	function onCombatFinished()
	{
		this.named_weapon.onCombatFinished();
		this.setLoaded(true);
	}

});

