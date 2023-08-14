this.free_company_spearman <- this.inherit("scripts/entity/tactical/free_company_abstract", {
	m = {
		Outfits = [
			[
				1,
				"mercenary_spearman_outfit_00"
			]
		],
		PerkList = this.Const.EnemyPerks.FreeCompanySpearman,
		PerkPower = 6
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.FreeCompanySpearman;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.FreeCompanySpearman.XP;
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
		b.setValues(this.Const.Tactical.Actor.FreeCompanySpearman);
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
		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_glaive"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/boar_spear"));
		}

		r = this.Math.rand(1, 100);

		if (r <= 30)
		{
			this.m.Items.equip(this.new("scripts/items/shields/kite_shield"));
		}
		else if (r <= 60)
		{
			this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));
		}
		else if (r <= 90)
		{
			this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/tools/throwing_net"));
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

