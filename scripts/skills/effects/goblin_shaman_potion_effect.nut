this.goblin_shaman_potion_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.goblin_shaman_potion";
		this.m.Name = "Hyperactive Sweat Glands";
		this.m.Icon = "skills/status_effect_125.png";
		this.m.IconMini = "status_effect_125_mini";
		this.m.Overlay = "status_effect_125";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = false;
		this.m.IsStacking = false;
	}

	function getDescription()
	{
		return "When in high stress situations, this character\'s mutated body produces a slimy, viscous substance and begins sweating it excessively. They\'ll have a much easier time escaping from any nets or traps in such a state. Just bring a towel.";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Always able to successfully escape from ensnaring effects, such as from nets or roots"
			},
			{
				id = 12,
				type = "hint",
				icon = "ui/tooltips/warning.png",
				text = "Further mutations will cause a longer period of sickness"
			}
		];
		return ret;
	}

	function onDeath( _fatalityType )
	{
		if (_fatalityType != this.Const.FatalityType.Unconscious)
		{
			this.World.Statistics.getFlags().set("isGoblinShamanPotionAcquired", false);
		}
	}

	function onDismiss()
	{
		this.World.Statistics.getFlags().set("isGoblinShamanPotionAcquired", false);
	}

});

