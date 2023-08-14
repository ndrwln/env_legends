this.undertaker_hat <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.undertaker_hat";
		this.m.Name = "Undertaker\'s Hat";
		this.m.Description = "A wide-brimmed feathered hat with a scarf to cover the mouth. Durable enough to protect against weather and scratches.";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.Variant = 240;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 120;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = 0;
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

