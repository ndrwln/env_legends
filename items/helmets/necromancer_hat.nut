this.necromancer_hat <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.necromancer_hat";
		this.m.Name = "Necromancer\'s Hat";
		this.m.Description = "A pointy hat with a broad rim, it smells faintly like rotten meat and embalming fluid";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ReplaceSprite = true;
		this.m.Variant = 0;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 25;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = 0;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_helmet_62";
		this.m.SpriteDamaged = "bust_helmet_62_damaged";
		this.m.SpriteCorpse = "bust_helmet_62_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_helmet_62.png";
	}

});

