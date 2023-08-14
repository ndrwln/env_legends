this.adorned_closed_flat_top_with_mail <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.adorned_closed_flat_top_with_mail";
		this.m.Name = "Adorned Closed Flat Top";
		this.m.Description = "A closed helmet with complete faceguard and mail to protect the neck. Heavily worn from extensive use, but adorned with relics and well-maintained.";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.Variant = 238;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2000;
		this.m.Condition = 250;
		this.m.ConditionMax = 250;
		this.m.StaminaModifier = -15;
		this.m.Vision = -3;
		this.blockUpgrades();
		this.m.Blocked[this.Const.Items.HelmetUpgrades.ExtraVanity] = false;
		this.m.Blocked[this.Const.Items.HelmetUpgrades.Rune] = false;
	}

	function updateVariant()
	{
		return this.helmet.updateVariant();
	}

	function onDeserialize( _in )
	{
		if (::Legends.Mod.Serialization.isSavedVersionAtLeast("16.0.3", _in.getMetaData()))
		{
			this.legend_helmet.onDeserialize(_in);
		}
		else
		{
			this.helmet.onDeserialize(_in);
		}
	}

});

