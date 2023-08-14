this.perk_legend_unarmed_training <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_unarmed_training";
		this.m.Name = this.Const.Strings.PerkName.LegendUnarmedTraining;
		this.m.Description = this.Const.Strings.PerkDescription.LegendUnarmedTraining;
		this.m.Icon = "ui/perks/perk_10.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.First + 2;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();

		if (_skill.getID() == "actives.hand_to_hand" || _skill.getID() == "actives.legend_unarmed_lunge")
		{
			_properties.DamageArmorMult = 1.0;
			local damage = (actor.getInitiative() + actor.getHitpoints()) / 3;

			if (actor.getOffhandItem() != null)
			{
				damage = damage * 0.5;
			}

			_properties.DamageRegularMin += damage - 10 - (_skill.getID() == "actives.hand_to_hand" ? 5 : 10);
			_properties.DamageRegularMax += damage + 10 - (_skill.getID() == "actives.hand_to_hand" ? 10 : 20);
		}

		if (_skill.getID() == "actives.legend_choke")
		{
			_properties.DamageTotalMult *= 1.5;
			_properties.MeleeSkill += 15;
		}
	}

	function onAfterUpdate( _properties )
	{
		local handToHand = this.getContainer().getSkillByID("actives.hand_to_hand");

		if (handToHand != null && handToHand.m.ActionPointCost >= 1)
		{
			handToHand.m.ActionPointCost -= 1;
			handToHand.m.FatigueCostMult *= this.Const.Combat.WeaponSpecFatigueMult;
		}

		local lunge = this.getContainer().getSkillByID("actives.legend_unarmed_lunge");

		if (lunge != null)
		{
			lunge.m.FatigueCostMult *= 0.5;
		}
	}

});

