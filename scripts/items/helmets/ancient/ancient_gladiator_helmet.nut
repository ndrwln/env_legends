this.ancient_gladiator_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.legend_ancient_gladiator_helmet";
		this.m.Name = "Ancient Gladiator Helmet";
		this.m.Description = "A well-crafted but partly decayed gladiator helmet of ancient design.";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ReplaceSprite = true;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1300;
		this.m.Condition = 195;
		this.m.ConditionMax = 195;
		this.m.StaminaModifier = -11;
		this.m.Vision = -2;
	}

	function updateVariant()
	{
		this.m.Sprite = "legend_ancient_gladiator";
		this.m.SpriteDamaged = "legend_ancient_gladiator_damaged";
		this.m.SpriteCorpse = "legend_ancient_gladiator_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_ancient_gladiator.png";
	}

});

