this.realm_of_nightmares_effect <- this.inherit("scripts/skills/skill", {
	m = {
		LastRoundApplied = 0
	},
	function create()
	{
		this.m.ID = "effects.realm_of_nightmares";
		this.m.Name = "Realm of Nightmares";
		this.m.Description = "The boundary to the world of dreams is erased where this character stands, and nightmares may manifest here to eat away at his sanity. Nightmares always hit with a mental attack that ignores armor, but the more resolve you have, the less damage they can inflict.";
		this.m.Icon = "skills/status_effect_102.png";
		this.m.IconMini = "status_effect_102_mini";
		this.m.Overlay = "status_effect_102";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function isHidden()
	{
		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap())
		{
			return true;
		}

		local myTile = this.getContainer().getActor().getTile();

		if (myTile.Properties.Effect == null || myTile.Properties.Effect.Timeout == this.Time.getRound() || myTile.Properties.Effect.Type != "shadows")
		{
			return true;
		}

		return false;
	}

});

