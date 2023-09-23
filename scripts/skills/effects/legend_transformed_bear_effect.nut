this.legend_transformed_bear_effect <- this.inherit("scripts/skills/effects/legend_transformed_effect", {
	m = {},
	function create()
	{
		this.legend_transformed_effect.create();
		this.m.ID = "effect.legend_transformed_bear";
		this.m.Name = "Bear Form";
		this.m.Description = "This character is currently a bear";
		this.m.Icon = "ui/perks/bear_circle.png";
		this.m.IconMini = "status_effect_08_mini";
		this.m.Agent1 = "bear_agent";
		this.m.Agent2 = "bear_agent";
		this.m.Head = "were_bear_head";
		this.m.Body = "were_bear_body";
		this.m.Injury = "were_bear_body_injured";
	}

	function getTooltip()
	{
		local ret = this.legend_transformed_effect.getTooltip();
		ret.extend([
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+50%[/color] hitpoints"
			}
		]);
		return ret;
	}

	function setSkills()
	{
		local actor = this.getContainer().getActor();

		if (!actor.getSkills().hasSkill("actives.legend_bear_claws"))
		{
			actor.getSkills().add(this.new("scripts/skills/actives/legend_bear_claws"));
		}

		if (!actor.getSkills().hasSkill("actives.legend_bear_bite"))
		{
			actor.getSkills().add(this.new("scripts/skills/actives/legend_bear_bite"));
		}
	}

	function removeSkills()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().removeByID("actives.legend_bear_claws");
		actor.getSkills().removeByID("actives.legend_bear_bite");
	}

	function onUpdate( _properties )
	{
		_properties.HitpointsMult *= 3.0;
		_properties.MeleeDefenseMult *= 1.5;
	}

});

