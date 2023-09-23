this.ai_use_potion <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.fake_drink_night_vision"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.UsePotion;
		this.m.Order = this.Const.AI.Behavior.Order.UsePotion;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];
		this.m.Skill = null;

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local inZonesOfControl = _entity.getTile().getZoneOfControlCountOtherThan(_entity.getAlliedFactions());

		if (inZonesOfControl != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.m.Skill.getID() == "actives.fake_drink_night_vision" && _entity.getSkills().hasSkill("special.night"))
		{
			scoreMult = scoreMult * this.Const.AI.Behavior.UsePotionNightVisionMult;
		}
		else
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.UsePotion * scoreMult;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Potion!");
		}

		this.m.Skill.use(_entity.getTile());

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		return true;
	}

});

