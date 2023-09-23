this.physician_mask <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.physician_mask";
		this.m.Name = "Physician\'s Mask";
		this.m.Description = "A thick leather hood with a distinctive, bird-like mask. The beak acts as a ventilator, containing sweet-smelling herbs to ward away sickness and disease.";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ReplaceSprite = true;
		this.m.Variant = 241;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 170;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -3;
		this.m.Vision = -1;
		this.blockUpgrades();
		this.m.Blocked[this.Const.Items.HelmetUpgrades.ExtraVanity] = false;
		this.m.Blocked[this.Const.Items.HelmetUpgrades.Rune] = false;
	}

	function getTooltip()
	{
		local result = this.legend_helmet.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Only take [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of damage inflicted by harmful miasmas"
		});
		return result;
	}

	function onUpdateProperties( _properties )
	{
		this.legend_helmet.onUpdateProperties(_properties);
		_properties.IsResistantToMiasma = true;
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

