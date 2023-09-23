this.new_knowledge_potion_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Battles = 0,
		IsCountingBattle = false
	},
	function create()
	{
		this.m.ID = "effects.knowledge_potion";
		this.m.Name = "Enhanced Learning";
		this.m.Description = "Thanks to a cocktail of nootropics euphemistically called \'Potion of Knowledge\', this character\'s cognitive functions, and particularly his memory and ability to learn, are enhanced along with his propensity for displaying nervous ticks.";
		this.m.Icon = "skills/status_effect_94.png";
		this.m.Type = this.m.Type | this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
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
				id = 13,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] Experience Gain"
			}
		];
		ret.push({
			id = 7,
			type = "hint",
			icon = "ui/icons/action_points.png",
			text = "Will be gone after " + (3 - this.m.Battles) + " more battles"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 2.0;
	}

	function onCombatStarted()
	{
		this.m.IsCountingBattle = true;
	}

	function onCombatFinished()
	{
		if (!this.m.IsCountingBattle)
		{
			return;
		}

		this.m.IsCountingBattle = false;
		++this.m.Battles;

		if (this.m.Battles >= 3)
		{
			this.removeSelf();
		}
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeU16(this.m.Battles);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.Battles = _in.readU16();
	}

});

