this.engineer <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Engineer;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Engineer.XP;
		this.human.create();
		this.m.Bodies = this.Const.Bodies.SouthernMale;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.Southern;
		this.m.BeardChance = 90;
		this.m.Ethnicity = 1;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_engineer_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Engineer);
		b.TargetAttractionMult = 1.1;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_southern");
		this.m.Skills.add(this.new("scripts/skills/actives/load_mortar_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
	}

	function onOtherActorDeath( _killer, _victim, _skill )
	{
		if (_victim.getType() == this.Const.EntityType.Slave && _victim.isAlliedWith(this))
		{
			return;
		}

		this.actor.onOtherActorDeath(_killer, _victim, _skill);
	}

	function onOtherActorFleeing( _actor )
	{
		if (_actor.getType() == this.Const.EntityType.Slave && _actor.isAlliedWith(this))
		{
			return;
		}

		this.actor.onOtherActorFleeing(_actor);
	}

	function assignRandomEquipment()
	{
		local r;
		local banner = 3;

		if (this.Math.rand(1, 100) <= 50)
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/knife"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/wooden_stick"));
			}
		}

		this.m.Items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"oriental/padded_vest"
			]
		]));
		local helm = this.Const.World.Common.pickHelmet([
			[
				1,
				"oriental/engineer_hat"
			]
		]);
		this.m.Items.equip(helm);
	}

});

