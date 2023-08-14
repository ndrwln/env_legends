this.legend_drums_of_war_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_drums_of_war";
		this.m.Name = "Drums of War";
		this.m.Description = "";
		this.m.Icon = "ui/perks/drums_of_war.png";
		this.m.Overlay = "drums_of_war_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.setFatigue(this.Math.max(0, actor.getFatigue() - 3));
		this.spawnIcon(this.m.Overlay, actor.getTile());
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

});

