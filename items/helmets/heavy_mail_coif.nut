this.heavy_mail_coif <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.heavy_mail_coif";
		this.m.Name = "Heavy Mail Coif";
		this.m.Description = "A full mail coif, heavier and sturdier than most others of its kind. Decorated with a colorful plait.";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.Variant = 237;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 375;
		this.m.Condition = 110;
		this.m.ConditionMax = 110;
		this.m.StaminaModifier = -5;
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

