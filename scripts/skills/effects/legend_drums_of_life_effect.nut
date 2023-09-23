this.legend_drums_of_life_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_drums_of_life";
		this.m.Name = "Drums of Life";
		this.m.Description = "";
		this.m.Icon = "ui/perks/drums_of_life.png";
		this.m.Overlay = "drums_of_life_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();

		if (actor.getHitpoints() < actor.getHitpointsMax())
		{
			actor.setHitpoints(this.Math.max(0, this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + 4)));
			this.spawnIcon(this.m.Overlay, actor.getTile());
		}
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

});

