this.free_company_infantry <- this.inherit("scripts/entity/tactical/free_company_abstract", {
	m = {
		Outfits = [
			[
				1,
				"mercenary_infantry_outfit_00"
			],
			[
				1,
				"mercenary_infantry_outfit_01"
			]
		],
		PerkList = this.Const.EnemyPerks.FreeCompanyInfantry,
		PerkPower = 9
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.FreeCompanyInfantry;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.FreeCompanyInfantry.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);

		if (this.Math.rand(1, 100) <= 10)
		{
			this.setGender(1);
		}
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.FreeCompanyInfantry);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 100);

		if (r <= 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/bardiche"));
		}
		else if (r <= 28)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greatsword"));
		}
		else if (r <= 52)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/two_handed_hammer"));
		}
		else if (r <= 76)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/two_handed_mace"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
		}

		if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 50)
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
			}
		}

		this.free_company_abstract.assignRandomEquipment();
	}

});

