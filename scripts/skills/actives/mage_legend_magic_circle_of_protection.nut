this.mage_legend_magic_circle_of_protection <- this.inherit("scripts/skills/actives/mage_legend_magic_skill", {
	m = {
		Range = 3,
		ProtectedActors = [],
		TurnsRemaining = 0,
		Tile = null
	},
	function create()
	{
		this.m.ID = "actives.mage_legend_magic_circle_of_protection";
		this.m.Name = "Magic Circle of Protection";
		this.m.Description = "A magic circle that protects all allies within at casting. Leaving the circle breaks the protection.";
		this.m.KilledString = "Magic Circled";
		this.m.Icon = "skills/mage_legend_magic_circle_of_protection_square.png";
		this.m.IconDisabled = "skills/mage_legend_magic_circle_of_protection_square_bw.png";
		this.m.Overlay = "mage_legend_magic_circle_of_protection_square";
		this.m.SoundOnUse = [
			"sounds/humans/0/human_fatigue_01.wav"
		];
		this.m.SoundVolume = 1.25;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 1;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 60;
		this.m.ResolveScaling = 10;
	}

	function getDefBonus()
	{
		return 5 + this.getResolveScaling();
	}

	function getResolveBonus()
	{
		local currentResolve = this.getContainer().getActor().getCurrentProperties().getBravery();
		return this.Math.round(currentResolve * 0.05);
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "All allies currently within range [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Range + "[/color] gain [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getDefBonus() + "[/color] melee/ranged defense and [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getResolveBonus() + "[/color] resolve for 2 turns or until they leave the circle."
		});
		return ret;
	}

	function tileInCircleRange( _targetTile )
	{
		if (this.m.Tile == null)
		{
			return false;
		}

		return _targetTile.getDistanceTo(this.m.Tile) <= this.m.Range;
	}

	function removeActorById( _id )
	{
		local index = this.m.ProtectedActors.find(_id);

		if (index == null)
		{
			return;
		}

		local length = this.m.ProtectedActors.len();

		if (index == length - 1)
		{
			this.m.ProtectedActors.pop();
			return;
		}

		if (index == 0)
		{
			this.m.ProtectedActors = this.m.ProtectedActors.slice(1);
			return;
		}

		local front = this.m.ProtectedActors.slice(0, index);
		local back = this.m.ProtectedActors.slice(index + 1);
		this.m.ProtectedActors = front.extend(back);
	}

	function updateProtectedActors()
	{
		if (this.m.TurnsRemaining <= 0)
		{
			this.m.ProtectedActors.clear();
		}
	}

	function startEffect()
	{
		this.m.TurnsRemaining = 2;
		this.updateProtectedActors();
		local actor = this.getContainer().getActor();
		this.m.Tile = actor.getTile();
		local targets = this.Tactical.Entities.getAllInstances();

		foreach( tar in targets )
		{
			foreach( t in tar )
			{
				if (t.isAlliedWith(actor) && this.tileInCircleRange(t.getTile()) && !t.getSkills().hasSkill("effects.mage_legend_effect_magic_circle_of_protection"))
				{
					local circleEffect = this.new("scripts/skills/effects/mage_legend_effect_magic_circle_of_protection");
					circleEffect.setCircle(this);
					t.getSkills().add(circleEffect);
					this.spawnIcon("perk_37", t.getTile());
				}
			}
		}
	}

	function endEffect()
	{
		foreach( actor in this.m.ProtectedActors )
		{
			if (actor.getSkills().hasSkill("effects.mage_legend_effect_magic_circle_of_protection"))
			{
				actor.getSkills().removeByID("effects.mage_legend_effect_magic_circle_of_protection");
			}
		}

		this.m.TurnsRemaining = 0;
	}

	function onTurnStart()
	{
		if (this.m.TurnsRemaining > 0)
		{
			if (--this.m.TurnsRemaining <= 0)
			{
				this.endEffect();
			}
		}
	}

	function isUsable()
	{
		return this.mage_legend_magic_skill.isUsable() && this.m.TurnsRemaining <= 0;
	}

	function onUse( _user, _targetTile )
	{
		this.startEffect();
	}

	function onCombatFinished()
	{
		this.endEffect();
	}

	function onDeath( _fatalityType )
	{
		this.endEffect();
	}

	function onMovementCompleted( _tile )
	{
		if (this.m.TurnsRemaining <= 0)
		{
			return;
		}

		if (!this.tileInCircleRange(_tile))
		{
			this.endEffect();
		}
	}

});

