this.killing_frenzy_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.killing_frenzy";
		this.m.Name = "Killing Frenzy!";
		this.m.Icon = "ui/perks/perk_36.png";
		this.m.IconMini = "perk_36_mini";
		this.m.Overlay = "perk_36";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "RAAAARGH! This character is on a killing frenzy for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.TurnsLeft + "[/color] more turn(s). Killing another opponent will refresh the killing frenzy for a 2 turn duration.";
	}

	function getTooltip()
	{
		return [
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
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] Damage"
			}
		];
	}

	function resetTime()
	{
		if (this.m.TurnsLeft != 2)
		{
			this.m.TurnsLeft = 2;

			if (this.getContainer().getActor().isPlacedOnMap())
			{
				this.spawnIcon("perk_36", this.getContainer().getActor().getTile());
			}
		}
	}

	function onAdded()
	{
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= 1.25;
		_properties.TargetAttractionMult *= 1.25;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

});

