this.perk_legend_shields_up <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_shields_up";
		this.m.Name = this.Const.Strings.PerkName.LegendShieldsUp;
		this.m.Description = this.Const.Strings.PerkDescription.LegendShieldsUp;
		this.m.Icon = "ui/perks/holdtheline_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		this.skill.onCombatStarted();
		local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());

		foreach( ally in allies )
		{
			local offhand_ally = ally.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (offhand_ally != null && offhand_ally.isItemType(this.Const.Items.ItemType.Shield))
			{
				if (!ally.getSkills().hasSkill("effects.shieldwall"))
				{
					ally.getSkills().add(this.new("scripts/skills/effects/shieldwall_effect"));
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(ally) + " uses Shieldwall due to the Shields Up perk");
				}
			}
		}
	}

});

