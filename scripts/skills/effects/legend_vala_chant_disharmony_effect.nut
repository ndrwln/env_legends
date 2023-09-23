this.legend_vala_chant_disharmony_effect <- this.inherit("scripts/skills/effects/legend_vala_chant", {
	m = {},
	function create()
	{
		this.legend_vala_chant.create();
		this.m.Range = 1;
		this.m.ID = "effects.legend_vala_chant_disharmony_effect";
	}

	function getTooltip()
	{
		if (!this.isHidden())
		{
			return [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Unable to enforce Zones of Control."
				}
			];
		}
		else
		{
			return;
		}
	}

	function updateEffect( _v )
	{
		if (_v)
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = false;
			this.m.Name = "Disharmony";
			this.m.Icon = "skills/status_effect_65.png";
			this.m.IconMini = "status_effect_65_mini";
			this.m.Overlay = "status_effect_65";
		}
		else
		{
			this.getContainer().getActor().m.IsUsingZoneOfControl = true;
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
		}
	}

	function onMovementCompleted( _tile )
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return;
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return;
		}

		this.spawnIcon("status_effect_65", this.getContainer().getActor().getTile());
		this.updateEffect(true);
	}

	function onRemoved()
	{
		this.getContainer().getActor().m.IsUsingZoneOfControl = true;
	}

	function onDeath( _fatalityType )
	{
		this.getContainer().getActor().m.IsUsingZoneOfControl = true;
	}

	function onCombatFinished()
	{
		this.getContainer().getActor().m.IsUsingZoneOfControl = true;
		this.removeSelf();
	}

});

