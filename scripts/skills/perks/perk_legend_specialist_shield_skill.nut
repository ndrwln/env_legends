this.perk_legend_specialist_shield_skill <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "perk.legend_specialist_shield_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistShieldSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistShieldSkill;
		this.m.Icon = "ui/perks/perk_05.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local hasShield = item != null && item.isItemType(this.Const.Items.ItemType.Shield);
		return this.m.TurnsLeft == 0 || !::Tactical.isActive() || !hasShield;
	}

	function getDescription()
	{
		return "This character has mastered the use of a shield. Even when they are hit, they are able to partially deflect the impact and reduce the damage. Their dedicated practice has made forming a shieldwall as natural as breathing for them.";
	}

	function getTooltip()
	{
		local ret = this.skill.getTooltip();
		ret.push({
			id = 3,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] instances of auto shieldwall on turn end left"
		});
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] damage reduction while using a shield"
		});
		return ret;
	}

	function onCombatStarted()
	{
		this.m.TurnsLeft = 2;
	}

	function onCombatFinished()
	{
		this.m.TurnsLeft = 0;
	}

	function onTurnEnd()
	{
		local actor = this.getContainer().getActor();

		if (this.m.TurnsLeft > 0 && !actor.getSkills().hasSkill("effects.shieldwall") && actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null && actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand).isItemType(this.Const.Items.ItemType.Shield))
		{
			actor.getSkills().add(this.new("scripts/skills/effects/shieldwall_effect"));
			this.m.TurnsLeft--;
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			_properties.DamageReceivedRegularMult *= 0.9;
		}
	}

});

