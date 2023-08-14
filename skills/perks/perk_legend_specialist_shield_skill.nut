this.perk_legend_specialist_shield_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_shield_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistShieldSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistShieldSkill;
		this.m.Icon = "ui/perks/perk_05.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		this.skill.onCombatStarted();
		local actor = this.getContainer().getActor();

		if (!actor.getSkills().hasSkill("effects.shieldwall") && actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null && actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand).isItemType(this.Const.Items.ItemType.Shield))
		{
			actor.getSkills().add(this.new("scripts/skills/effects/shieldwall_effect"));
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " was Born with a Board and uses Shieldwall");
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			_properties.RangedDefense += 10;
		}
	}

});

