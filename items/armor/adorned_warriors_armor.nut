this.adorned_warriors_armor <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "armor.body.adorned_warriors_armor";
		this.m.Name = "Adorned Warrior\'s Armor";
		this.m.Description = "A long mail shirt covered by a riveted leather gambeson. Heavily worn from extensive use, but adorned with relics and well-maintained.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 108;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1600;
		this.m.Condition = 200;
		this.m.ConditionMax = 200;
		this.m.StaminaModifier = -22;
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

