this.therianthropy_potion_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.therianthropy_potion";
		this.m.Name = "Therianthropic Potion";
		this.m.Description = "A foul concoction that blends the essences of beasts with that of men. Drink at your own peril.";
		this.m.SlotType = this.Const.ItemSlot.Bag;
		this.m.IsAllowedInBag = true;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "";
		this.m.Icon = "consumables/potion_therianthropy.png";
		this.m.StaminaModifier = -4;
		this.m.Value = 500;
	}

	function getTooltip()
	{
		local result = this.accessory.getTooltip();
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onEquip()
	{
		this.accessory.onEquip();
		local skill = this.new("scripts/skills/actives/drink_therianthropy_potion_skill");
		skill.setItem(this);
		this.addSkill(skill);
	}

	function onPutIntoBag()
	{
		this.onEquip();
	}

});

