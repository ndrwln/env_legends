this.armor_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.armor";
		this.m.Duration = 40.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We shall outfit a contingent of at least three men with heavy armor\nto act as a bulwark against dangerous opponents.";
		this.m.UIText = "Have 3 pieces of armor and helmets with 230+ durability";
		this.m.TooltipText = "Have 3 pieces of body armor, and 3 helmets, each with 230 durability or more. Whether you buy them or loot them off of the battlefield, they will protect your men equally well.";
		this.m.SuccessText = "[img]gfx/ui/events/event_35.png[/img]Spirits rise with the acquisition of more heavy armor and helmets for the %companyname%.%SPEECH_ON%Feel that? That is craftsmanship.%SPEECH_OFF%%randombrother% says, rapping a hardwood pommel against his fellow brother\'s newly armored head.%SPEECH_ON%Think of all the well-paid contracts we missed out on because of our crummy armor and pathetic equipment before.%SPEECH_OFF%From now on, the backline can breathe easier going into battle, knowing that their heavily armored brothers will be there to take the brunt of the assault. Should they fall, their unwieldy bulk will at least delay the enemy, giving their lightly armored companions a chance to swiftly retreat.";
		this.m.SuccessButtonText = "This will serve us well in the battles to come.";
	}

	function getArmor()
	{
		local ret = {
			Armor = 0,
			Helmet = 0
		};
		local items = this.World.Assets.getStash().getItems();

		foreach( item in items )
		{
			if (item != null)
			{
				if (item.isItemType(this.Const.Items.ItemType.Armor) && item.getArmorMax() >= 230)
				{
					++ret.Armor;
				}
				else if (item.isItemType(this.Const.Items.ItemType.Helmet) && item.getArmorMax() >= 230)
				{
					++ret.Helmet;
				}
			}
		}

		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (item != null)
			{
				if (item.getArmorMax() >= 230)
				{
					++ret.Helmet;
				}
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);

			if (item != null)
			{
				if (item.getArmorMax() >= 230)
				{
					++ret.Armor;
				}
			}
		}

		return ret;
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days <= 40)
		{
			return;
		}

		if (!this.World.Ambitions.getAmbition("ambition.make_nobles_aware").isDone())
		{
			return;
		}

		local armor = this.getArmor();

		if (armor.Armor >= 3 || armor.Helmet >= 3)
		{
			return;
		}

		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		local armor = this.getArmor();

		if (armor.Armor >= 3 && armor.Helmet >= 3)
		{
			return true;
		}

		return false;
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
	}

});

