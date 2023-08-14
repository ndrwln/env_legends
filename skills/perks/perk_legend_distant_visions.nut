this.perk_legend_distant_visions <- this.inherit("scripts/skills/skill", {
	m = {
		BaseChance = 10,
		DaysNotProcced = 0
	},
	function create()
	{
		this.m.ID = "perk.legend_distant_visions";
		this.m.Name = this.Const.Strings.PerkName.LegendDistantVisions;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDistantVisions;
		this.m.Icon = "ui/perks/vision_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onNewDay()
	{
		if (!this.getContainer().getActor().isInReserves())
		{
			return;
		}

		if (this.Math.rand(1, 100) <= this.m.BaseChance + this.m.DaysNotProcced / 4)
		{
			if (this.World.State.getDistantVisionBonus())
			{
				this.m.DaysNotProcced = 0;
				return;
			}

			this.World.State.setDistantVisionBonus(true);
			this.m.DaysNotProcced = 0;
			this.World.Events.fire("event.legend_distant_visions");
		}
		else
		{
			this.m.DaysNotProcced += 1;
		}
	}

});

