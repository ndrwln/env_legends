this.legend_unleash_catapult <- this.inherit("scripts/skills/skill", {
	m = {
		Entity = null,
		EntityName = "catapult",
		Script = "scripts/entity/tactical/legend_war_catapult"
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.legend_unleash_catapult";
		this.m.Name = "Summon Catapult";
		this.m.Description = "Summon a catapult. Needs a free tile adjacent.";
		this.m.Icon = "skills/catapult_square.png";
		this.m.IconDisabled = "skills/catapult_square_bw.png";
		this.m.Overlay = "active_165";
		this.m.SoundOnUse = [
			"sounds/enemies/unhold_idle_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Last + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function addResources()
	{
		this.skill.addResources();
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
		return ret;
	}

	function isUsable()
	{
		if (this.getContainer().hasSkill("effects.legend_summoned_catapult_effect"))
		{
			return false;
		}

		if (this.m.Item.isUnleashed() || !this.skill.isUsable())
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.m.Item.isUnleashed();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		local actor = this.getContainer().getActor();
		return this.skill.onVerifyTarget(_originTile, _targetTile) && _targetTile.IsEmpty;
	}

	function onUse( _user, _targetTile )
	{
		_user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_catapult_effect"));
		local entity = this.Tactical.spawnEntity(this.m.Script, _targetTile.Coords.X, _targetTile.Coords.Y);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity.setName(this.m.EntityName);
		return true;
	}

});

