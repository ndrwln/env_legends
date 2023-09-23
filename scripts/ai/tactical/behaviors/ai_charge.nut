this.ai_charge <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.charge",
			"actives.unstoppable_charge"
		]
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.Charge;
		this.m.Order = this.Const.AI.Behavior.Order.Charge;
		this.m.IsThreaded = false;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		local skill = this.selectSkill(this.m.PossibleSkills);

		if (skill != null)
		{
			local targetsInMelee = this.queryTargetsInMeleeRange(1, skill.getMaxRange() + 1);

			if (targetsInMelee.len() != 0)
			{
				this.getProperties().EngageRangeMin = _entity.getIdealRange();
				this.getProperties().EngageRangeMax = _entity.getIdealRange();
				this.getProperties().EngageRangeIdeal = _entity.getIdealRange();
			}
			else
			{
				this.getProperties().EngageRangeMin = skill.getMinRange();
				this.getProperties().EngageRangeMax = skill.getMaxRange() + 1;
				this.getProperties().EngageRangeIdeal = skill.getMaxRange() + 1;
			}
		}

		return this.Const.AI.Behavior.Score.Zero;
	}

});

