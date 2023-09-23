this.voice_of_davkul_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.voice_of_davkul";
		this.m.Name = "Voice of Davkul";
		this.m.Description = "This character has heard the voice of Davkul speak truth through his fleshen conduit. He\'s prepared to go beyond his physical limits to the bidding of his god.";
		this.m.Icon = "skills/status_effect_112.png";
		this.m.IconMini = "status_effect_112_mini";
		this.m.Overlay = "status_effect_112";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = true;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.setFatigue(this.Math.max(0, actor.getFatigue() - 10));
		this.spawnIcon(this.m.Overlay, actor.getTile());
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}

});

