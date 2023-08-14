this.perk_legend_big_game_hunter <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_big_game_hunter";
		this.m.Name = this.Const.Strings.PerkName.LegendBigGameHunter;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBigGameHunter;
		this.m.Icon = "ui/perks/BigGameHunterPerk.png";
		this.m.IconDisabled = "ui/perks/BigGameHunterPerk_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.isArmedWithRangedWeapon() && !actor.getSkills().hasSkill("effect.legend_hunting_big_game"))
		{
			actor.getSkills().add(this.new("scripts/skills/effects/legend_hunting_big_game"));
		}
	}

});

