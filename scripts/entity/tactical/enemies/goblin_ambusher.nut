this.goblin_ambusher <- this.inherit("scripts/entity/tactical/goblin", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.GoblinAmbusher;
		this.m.XP = this.Const.Tactical.Actor.GoblinAmbusher.XP;
		this.goblin.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/goblin_ranged_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.goblin.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.GoblinAmbusher);
		b.DamageDirectMult = 1.25;
		b.TargetAttractionMult = 1.1;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.getSprite("head").setBrush("bust_goblin_01_head_0" + this.Math.rand(1, 3));
		this.getSprite("quiver").Visible = true;
		this.addDefaultStatusSprites();

		if (!this.m.IsLow)
		{
			b.IsSpecializedInBows = true;
			b.Vision = 8;

			if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 180)
			{
				b.DamageDirectMult = 1.35;
			}
		}

		this.m.Skills.add(this.new("scripts/skills/racial/goblin_ambusher_racial"));

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		}
	}

	function assignRandomEquipment()
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
		{
			local r = this.Math.rand(1, 2);

			if (r == 1 || !this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 60)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/greenskins/goblin_heavy_bow"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/greenskins/goblin_bow"));
			}
		}

		this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.m.Items.addToBag(this.new("scripts/items/weapons/greenskins/goblin_notched_blade"));

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body) == null)
		{
			local item = this.Const.World.Common.pickArmor([
				[
					1,
					"greenskins/goblin_skirmisher_armor"
				]
			]);
			this.m.Items.equip(item);
		}

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head) == null)
		{
			local item = this.Const.World.Common.pickHelmet([
				[
					1,
					"greenskins/goblin_skirmisher_helmet"
				]
			]);
			this.m.Items.equip(item);
		}

		if (this.Math.rand(1, 100) <= 10)
		{
			this.m.Items.addToBag(this.new("scripts/items/accessory/poison_item"));
		}

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Items.addToBag(this.new("scripts/items/accessory/poison_item"));
		}
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = [
			"weapons/named/named_goblin_heavy_bow"
		];
		this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		return true;
	}

});

