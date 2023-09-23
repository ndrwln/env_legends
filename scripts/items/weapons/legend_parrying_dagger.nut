this.legend_parrying_dagger <- this.inherit("scripts/items/shields/shield", {
	m = {
		Variants = [],
		RegularDamage = 20,
		RegularDamageMax = 40,
		ArmorDamageMult = 0.7,
		DirectDamageMult = 0.2,
		DirectDamageAdd = 0.0,
		ChanceToHitHead = 0
	},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.legend_parrying_dagger";
		this.m.Name = "Parrying dagger";
		this.m.Description = "An offhand dagger for actively parrying an opponent.\n\n When parried or if an opponent misses you, their defences will be lowered.\n\n The \'Split Shield\' skill only does 20% damage against this dagger";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.m.ItemType = this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.Weapon;
		this.updateVariant();
		this.m.Value = 500;
		this.m.MeleeDefense = 5;
		this.m.RangedDefense = 0;
		this.m.StaminaModifier = -2;
		this.m.Condition = 36;
		this.m.ConditionMax = 36;
	}

	function updateVariant()
	{
		this.m.Sprite = "icon_legend_parrying_dagger_0" + this.m.Variant;
		this.m.SpriteDamaged = "icon_legend_parrying_dagger_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "icon_legend_parrying_dagger_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "weapons/melee/legend_parrying_dagger_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/melee/legend_parrying_dagger_0" + this.m.Variant + "_70x70.png";
	}

	function getTooltip()
	{
		local result = this.shield.getTooltip();
		local find;

		foreach( i, tooltip in result )
		{
			if (tooltip.id != 4 || tooltip.type != "progressbar")
			{
				continue;
			}

			find = i;
			break;
		}

		if (find != null)
		{
			if (this.m.RegularDamage > 0)
			{
				result.insert(find + 1, {
					id = 4,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "Damage of [color=" + this.Const.UI.Color.DamageValue + "]" + this.m.RegularDamage + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + this.m.RegularDamageMax + "[/color]"
				});
			}

			if (this.m.DirectDamageMult > 0)
			{
				result.insert(find + 2, {
					id = 64,
					type = "text",
					icon = "ui/icons/direct_damage.png",
					text = "[color=" + this.Const.UI.Color.DamageValue + "]" + this.Math.floor((this.m.DirectDamageMult + this.m.DirectDamageAdd) * 100) + "%[/color] of damage ignores armor"
				});
			}

			if (this.m.ArmorDamageMult > 0)
			{
				result.insert(find + 3, {
					id = 5,
					type = "text",
					icon = "ui/icons/armor_damage.png",
					text = "[color=" + this.Const.UI.Color.DamageValue + "]" + this.Math.floor(this.m.ArmorDamageMult * 100) + "%[/color] effective against armor"
				});
			}

			if (this.m.ChanceToHitHead > 0)
			{
				result.insert(find + 4, {
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.ChanceToHitHead + "%[/color]"
				});
			}
		}

		return result;
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/stab"));
		this.addSkill(this.new("scripts/skills/actives/legend_en_garde"));
		this.addSkill(this.new("scripts/skills/actives/puncture"));
		this.addSkill(this.new("scripts/skills/effects/legend_parrying_dagger_effect"));
		local parrying = this.new("scripts/skills/effects/legend_parrying_effect");
		parrying.m.IsFromItem = true;
		this.getContainer().getActor().getSkills().add(parrying);
	}

	function onUnequip()
	{
		local skill = this.getContainer().getActor().getSkills().getSkillByID("effects.legend_parrying");

		if (skill != null && skill.m.IsFromItem)
		{
			this.getContainer().getActor().getSkills().removeByID("effects.legend_parrying");
		}

		this.shield.onUnequip();
	}

	function getAmmoMax()
	{
		return 0;
	}

});

