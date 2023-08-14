this.legend_RSS_defense <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_RSS_defense";
		this.m.Name = "Rune Sigil: Defense";
		this.m.Description = "Rune Sigil: Defense";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onUpdate( _properties )
	{
		if (this.getItem() == null)
		{
			return;
		}

		_properties.MeleeDefenseMult *= 1.0 + this.getItem().getRuneBonus1() * 1.0 / 100.0;
		_properties.RangedDefenseMult *= 1.0 + this.getItem().getRuneBonus2() * 1.0 / 100.0;
	}

});

