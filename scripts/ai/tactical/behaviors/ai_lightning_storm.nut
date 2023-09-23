this.ai_lightning_storm <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.lightning_storm"
		],
		Skill = null,
		Target = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.LightningStorm;
		this.m.Order = this.Const.AI.Behavior.Order.LightningStorm;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;
		this.m.Target = null;

		if (this.Time.getRound() == 1)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.m.Skill.isWaitingOnImpact())
		{
			return this.Const.AI.Behavior.Score.LightningStorm * 4.0;
		}

		local targets = this.getAgent().getKnownOpponents();
		this.m.Target = this.selectBestTarget(_entity, targets);

		if (this.m.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.LightningStorm;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			if (this.m.Target == null)
			{
				this.getAgent().adjustCameraToDestination(this.m.Skill.getTiles()[15]);
			}
			else
			{
				this.getAgent().adjustCameraToDestination(this.m.Target);
			}

			this.m.IsFirstExecuted = false;
			return false;
		}
		else
		{
			if (this.m.Target == null)
			{
				this.m.Skill.updateImpact();
			}
			else
			{
				this.m.Skill.use(this.m.Target);
			}

			if (_entity.isAlive())
			{
				this.getAgent().declareAction();

				if (this.m.Skill.getDelay() != 0)
				{
					this.getAgent().declareEvaluationDelay(this.m.Skill.getDelay());
				}
			}

			this.m.Skill = null;
			this.m.Target = null;
			return true;
		}

		return false;
	}

	function selectBestTarget( _entity, _targets )
	{
		local size = this.Tactical.getMapSize();
		local scores = [];
		scores.resize(size.X);

		for( local i = 0; i < scores.len(); i = ++i )
		{
			scores[i] = {
				Score = 0.0,
				X = i
			};
		}

		local entities = this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction());

		foreach( e in entities )
		{
			if (e.getType() == this.Const.EntityType.SkeletonLichMirrorImage || e.getType() == this.Const.EntityType.SkeletonLich)
			{
				local skill = e.getSkills().getSkillByID("actives.lightning_storm");

				if (skill != null && skill.getTiles().len() != 0)
				{
					scores[skill.getTiles()[0].SquareCoords.X].Score = -999999.0;
				}
			}
		}

		foreach( target in _targets )
		{
			if (target.Actor.getType() == this.Const.EntityType.Wardog || target.Actor.getType() == this.Const.EntityType.ArmoredWardog || target.Actor.getType() == this.Const.EntityType.Warhound)
			{
				continue;
			}

			local x = target.Actor.getTile().SquareCoords.X;
			local score = this.queryTargetValue(_entity, target.Actor, this.m.Skill);

			if (target.Actor.getCurrentProperties().IsStunned || target.Actor.getCurrentProperties().IsRooted)
			{
				score = score * this.Const.AI.Behavior.LightningStormStunnedTargetMult;
			}

			if (target.Actor.getTile().hasZoneOfControlOtherThan(target.Actor.getAlliedFactions()))
			{
				score = score * this.Const.AI.Behavior.LightningStormTargetInZOCMult;
			}

			scores[x].Score += score;
		}

		scores.sort(function ( _a, _b )
		{
			if (_a.Score > _b.Score)
			{
				return -1;
			}
			else if (_a.Score < _b.Score)
			{
				return 1;
			}

			return 0;
		});

		if (scores[0].Score > 0)
		{
			return this.Tactical.getTileSquare(scores[0].X, 15);
		}
		else
		{
			return null;
		}
	}

});

