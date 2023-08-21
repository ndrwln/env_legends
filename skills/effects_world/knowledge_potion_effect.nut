this.knowledge_potion_effect <- this.inherit("scripts/skills/injury/injury", {
	m = {
		XPGainMult = 2.0
	},
	function create()
	{
		this.injury.create();
		this.m.ID = "effects.knowledge_potion";
		this.m.Name = "Enhanced Learning";
		this.m.Description = "Thanks to a cocktail of nootropics euphemistically called \'Potion of Knowledge\', this character\'s cognitive functions, and particularly his memory and ability to learn, are enhanced along with his propensity for displaying nervous ticks.";
		this.m.Icon = "skills/status_effect_94.png";
		this.m.Type = this.m.Type | this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
		this.m.IsHealingMentioned = false;
		this.m.IsTreatable = false;
		this.m.IsContentWithReserve = false;
		this.m.HealingTimeMin = 2;
		this.m.HealingTimeMax = 2;
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + (this.m.XPGainMult * 100 - 100) + "%[/color] Experience Gain"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
		this.injury.onUpdate(_properties);
		_properties.XPGainMult *= this.m.XPGainMult;
	}

	function onSerialize( _out )
	{
		this.injury.onSerialize(_out);
		_out.writeU8(this.m.HealingTimeMin);
		_out.writeU8(this.m.HealingTimeMax);
		_out.writeF32(this.m.XPGainMult);
	}

	function onDeserialize( _in )
	{
		this.injury.onDeserialize(_in);
		this.m.HealingTimeMin = _in.readU8();
		this.m.HealingTimeMax = _in.readU8();
		this.m.XPGainMult = _in.readF32();
	}

});

