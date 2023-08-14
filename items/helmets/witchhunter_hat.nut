this.witchhunter_hat <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.witchhunter_hat";
		this.m.Name = "Witchhunter\'s Hat";
		this.m.Description = "A tough leather hat that provides decent protection against scratches.";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ReplaceSprite = true;
		this.m.Variant = 23;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = 0;
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Wearer is not affected by night penalties"
		});
		return result;
	}

	function onUpdateProperties( _properties )
	{
		local staminaMult = 1.0;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.brawny"))
		{
			staminaMult = 0.75;
		}

		_properties.Armor[this.Const.BodyPart.Head] += this.m.Condition;
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.ConditionMax;
		_properties.Stamina += this.Math.ceil(this.m.StaminaModifier * staminaMult);
		_properties.Vision += this.getVision();
		_properties.IsAffectedByNight = false;
	}

});

