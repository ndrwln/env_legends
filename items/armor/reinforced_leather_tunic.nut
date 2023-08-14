this.reinforced_leather_tunic <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "armor.body.reinforced_leather_tunic";
		this.m.Name = "Reinforced Leather Armor";
		this.m.Description = "An ominous black coat worn over a sturdy tunic, reinforced with thick leather armor and iron bracers.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 112;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 500;
		this.m.Condition = 100;
		this.m.ConditionMax = 100;
		this.m.StaminaModifier = -9;
		this.blockUpgrades();
		this.m.Blocked[this.Const.Items.ArmorUpgrades.Attachment] = false;
		this.m.Blocked[this.Const.Items.ArmorUpgrades.Rune] = false;
	}

	function onDeserialize( _in )
	{
		if (::Legends.Mod.Serialization.isSavedVersionAtLeast("16.0.3", _in.getMetaData()))
		{
			this.legend_armor.onDeserialize(_in);
		}
		else
		{
			this.armor.onDeserialize(_in);
		}
	}

});

