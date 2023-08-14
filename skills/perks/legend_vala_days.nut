this.legend_vala_days <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vala_days";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "ui/perks/legend_vala_days.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 8;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = true;
	}

	function isHidden()
	{
		return false;
	}

	function getWeekDay()
	{
		local worldday = this.World.getTime().Days;
		local weekday = worldday / 7.0 - this.Math.floor(worldday / 7.0);

		if (weekday > 0.12 && weekday < 0.17)
		{
			return "sunday";
		}
		else if (weekday > 0.25999999 && weekday < 0.31)
		{
			return "monday";
		}
		else if (weekday > 0.4 && weekday < 0.45)
		{
			return "tuesday";
		}
		else if (weekday > 0.55 && weekday < 0.6)
		{
			return "wednesday";
		}
		else if (weekday > 0.69 && weekday < 0.74000001)
		{
			return "thursday";
		}
		else if (weekday > 0.83 && weekday < 0.88)
		{
			return "friday";
		}
		else
		{
			return "saturday";
		}
	}

	function updateDay()
	{
		if (this.getWeekDay() == "sunday")
		{
			this.m.Name = "Sunday: Sol\'s Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
		else if (this.getWeekDay() == "monday")
		{
			this.m.Name = "Monday: Mani\'s Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
		else if (this.getWeekDay() == "tuesday")
		{
			this.m.Name = "Tuesday: Tyr\'s Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
		else if (this.getWeekDay() == "wednesday")
		{
			this.m.Name = "Wednesday: Odin\'s Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
		else if (this.getWeekDay() == "thursday")
		{
			this.m.Name = "Thursday: Thor\'s Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
		else if (this.getWeekDay() == "friday")
		{
			this.m.Name = "Friday: Frigg\'s Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
		else
		{
			this.m.Name = "Saturday: Bathing Day";
			this.m.Description = "";
			this.m.Icon = "ui/perks/legend_vala_days.png";
		}
	}

	function getTooltip()
	{
		this.updateDay();
		local ret = this.skill.getTooltip();

		if (this.getWeekDay() == "sunday")
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}
		else if (this.getWeekDay() == "monday")
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}
		else if (this.getWeekDay() == "tuesday")
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}
		else if (this.getWeekDay() == "wednesday")
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}
		else if (this.getWeekDay() == "thursday")
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}
		else if (this.getWeekDay() == "friday")
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}
		else
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Something, something."
			});
		}

		return ret;
	}

	function onNewDay()
	{
		this.updateDay();
	}

	function onUpdate( _properties )
	{
		this.updateDay();

		if (this.getWeekDay() == "sunday")
		{
		}
		else if (this.getWeekDay() == "monday")
		{
		}
		else if (this.getWeekDay() == "tuesday")
		{
		}
		else if (this.getWeekDay() == "wednesday")
		{
		}
		else if (this.getWeekDay() == "thursday")
		{
		}
		else if (this.getWeekDay() == "friday")
		{
		}
		else
		{
		}
	}

});

