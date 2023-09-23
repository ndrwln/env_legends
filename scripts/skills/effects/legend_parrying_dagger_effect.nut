this.legend_parrying_dagger_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 5
	},
	function create()
	{
		this.m.ID = "effects.legend_parrying_dagger";
		this.m.Name = "Parrying Dagger Defense";
		this.m.Description = "Parrying Daggers work best against a single opponent, giving +20 melee defense when there is only a single adjacent enemy. This effect diminishes when facing more than one enemy at a time.";
		this.m.Icon = "ui/perks/parrying_circle.png";
		this.m.IconMini = "mini_parrying_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Item;
		this.m.IsActive = false;
		this.m.IsStacking = false;
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
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Bonus + "[/color] Melee Defense"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsParrying = true;

		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			return;
		}

		local actor = this.getContainer().getActor();
		local numAdjacentEnemies = ::Tactical.Entities.getHostileActors(actor.getFaction(), actor.getTile(), 1, true).len();
		this.m.Bonus = numAdjacentEnemies == 1 ? 20 : 5;
		_properties.MeleeDefense += this.m.Bonus;
	}

});

