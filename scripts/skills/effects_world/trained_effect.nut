this.trained_effect <- this.inherit("scripts/skills/injury/injury", {
	m = {
		XPGainMult = 1.0
	},
	function create()
	{
		this.injury.create();
		this.m.ID = "effects.trained";
		this.m.Name = "Training Experience";
		this.m.Description = "Having had the honor of training with and learning from experienced fighters recently, this character has soaked in knowledge and now needs to apply what he learned on the battlefield in order to fully grasp it and make it his own.";
		this.m.Icon = "skills/status_effect_62.png";
		this.m.Type = this.m.Type | this.Const.SkillType.StatusEffect;
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
		_out.writeString(this.m.Icon);
	}

	function onDeserialize( _in )
	{
		this.injury.onDeserialize(_in);
		this.m.HealingTimeMin = _in.readU8();
		this.m.HealingTimeMax = _in.readU8();
		this.m.XPGainMult = _in.readF32();
		this.m.Icon = _in.readString();
	}

});

