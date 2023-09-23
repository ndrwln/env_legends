this.legend_vala_currently_chanting <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_vala_currently_chanting";
		this.m.Name = "Currently Chanting";
		this.m.Icon = "ui/perks/perk_28.png";
		this.m.IconMini = "perk_28_mini";
		this.m.Overlay = "perk_28";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 6;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return false;
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
					text = "This character is currently chanting."
				}
			];
		}
		else
		{
			return;
		}
	}

	function onRemoved()
	{
		local ChantDisharmony = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_chant_disharmony");
		local ChantFury = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_chant_fury");

		if (ChantDisharmony != null)
		{
			ChantDisharmony.resetChant();
		}

		if (ChantFury != null)
		{
			ChantFury.resetChant();
		}
	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 1.33;
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}

});

