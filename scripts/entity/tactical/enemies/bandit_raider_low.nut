this.bandit_raider_low <- this.inherit("scripts/entity/tactical/enemies/bandit_raider", {
	m = {},
	function create()
	{
		this.bandit_raider.create();
		this.m.IsLow = true;
		local writeTable = clone this.Const.RandomizedCharacterInfo.BanditRaiderLow;
		this.writeTablesFromParam(writeTable);
	}

	function onInit()
	{
		this.bandit_raider.onInit();
		this.m.BaseProperties.MeleeSkill -= 5;
		this.m.BaseProperties.MeleeDefense -= 5;
		this.m.BaseProperties.RangedDefense -= 5;
		this.m.BaseProperties.FatigueRecoveryRate = 15;
		this.m.Skills.update();
	}

	function assignRandomEquipment()
	{
		this.bandit_raider.assignRandomEquipment();

		if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 25)
		{
			local r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
			}
		}
	}

});

