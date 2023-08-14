this.legend_hunting_big_game <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_hunting_big_game";
		this.m.Name = "Hunting Big Game";
		this.m.Icon = "ui/perks/BigGameHunterPerk.png";
		this.m.IconMini = "mini_big_game_hunter";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Description = "When fighting beasts, gain an additional modifier that deals bonus damage based on the target\'s missing health. When not fighting beasts, gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] ranged weapon damage but no additional modifier. Only works with ranged weapons.";
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}

		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			this.m.Type = ::Const.SkillType.Trait;
			return;
		}

		local fightingBeasts = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Beasts || enemy.getType() == this.Const.EntityType.BarbarianUnhold || enemy.getType() == this.Const.EntityType.BarbarianUnholdFrost)
			{
				fightingBeasts = true;
				break;
			}
		}

		if (fightingBeasts)
		{
			_properties.DamageRegularMult += 1.0 - _targetEntity.getHitpoints() / (_targetEntity.getHitpointsMax() * 1.0);
		}
		else
		{
			_properties.RangedDamageMult *= 1.1;
		}
	}

});

