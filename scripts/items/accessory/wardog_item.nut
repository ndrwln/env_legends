this.wardog_item <- this.inherit("scripts/items/accessory/accessory_dog", {
	m = {
		Skill = null,
		Entity = null
	},
	function create()
	{
		this.accessory_dog.create();
		this.m.Script = "scripts/entity/tactical/wardog";
		this.m.Variant = this.Math.rand(1, 4);
		this.updateVariant();
		this.m.ID = "accessory.wardog";
		this.m.Name = this.Const.Strings.WardogNames[this.Math.rand(0, this.Const.Strings.WardogNames.len() - 1)] + " the Wardog";
		this.m.Description = "A strong and loyal dog bred for war. Can be unleashed in battle for scouting, tracking or running down routing enemies.";
		this.m.Value = 200;
	}

	function getDescription()
	{
		if (this.m.Entity == null)
		{
			return this.item.getDescription();
		}
		else
		{
			return "The collar of a wardog that has been unleashed onto the battlefield.";
		}
	}

	function getName()
	{
		if (this.m.Entity == null)
		{
			return this.item.getName();
		}
		else
		{
			return "Wardog Collar";
		}
	}

	function onEquip()
	{
		this.accessory_dog.onEquip();
		local unleash = this.new("scripts/skills/actives/unleash_wardog");
		unleash.setItem(this);
		this.m.Skill = this.WeakTableRef(unleash);
		this.addSkill(unleash);
	}

	function setEntity( _e )
	{
		this.m.Entity = _e;

		if (this.m.Entity != null)
		{
			this.m.Icon = "tools/dog_01_leash_70x70.png";
		}
		else
		{
			this.m.Icon = "tools/dog_01_0" + this.m.Variant + "_70x70.png";
		}
	}

});

