this.cart_large_item <- this.inherit("scripts/items/spawns/spawn_item", {
	m = {
		UnleashSounds = [
			"sounds/misc/donkey_idle_01.wav",
			"sounds/misc/donkey_idle_02.wav",
			"sounds/misc/donkey_idle_03.wav"
		]
	},
	function create()
	{
		this.spawn_item.create();
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ID = "spawns.cart_02";
		this.m.Name = "Large Cart";
		this.m.Description = "A large cart and donkey, excellent for carrying many things, but must be protected in battle.";
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IsChangeableInBattle = false;
		this.m.Icon = "tools/cart_02_70x70n.png";
		this.m.Value = 25000;
		this.m.MedicinePerDay = 0;
	}

	function playInventorySound( _eventType )
	{
		local index = this.Math.rand(1, 16);
		local variant = "" + index;

		if (index < 8)
		{
			variant = "0" + index;
		}

		this.Sound.play("sounds/misc/donkey_idle_" + variant + ".wav", this.Const.Sound.Volume.Inventory);
	}

});

