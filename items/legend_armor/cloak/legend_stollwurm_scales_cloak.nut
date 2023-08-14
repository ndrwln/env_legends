this.legend_stollwurm_scales_cloak <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.legend_stollwurm_scales";
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.Name = "Stollwurm Scale Cloak";
		this.m.Description = "A cloak made out of the scales of a Stollwurm. Not only is it a rare and impressive trophy, it also offers excellent protection against any kind of crowd control effects on top of the immunity against acid";
		this.m.ArmorDescription = "A cloak made out of Stollwurm scales grants immunity against crowd control effects and acid.";
		this.m.Icon = "armor_upgrades/upgrade_stollwurm.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_stollwurm.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_stollwurm.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_stollwurm_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_stollwurm_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_stollwurm_back_dead";
		this.m.Value = 9000;
		this.m.Condition = 30;
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -4;
	}

	function getTooltip()
	{
		local result = this.legend_armor_cloak.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immune to stun, knockback, grab and acid"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immune to stun, knockback, grab and acid"
		});
	}

	function onUpdateProperties( _properties )
	{
		this.legend_armor_cloak.onUpdateProperties(_properties);
		_properties.IsImmuneToStun = true;
		_properties.IsImmuneToKnockBackAndGrab = true;
	}

	function onEquip()
	{
		this.legend_armor_cloak.onEquip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().add("body_immune_to_acid");
		}
	}

	function onUnequip()
	{
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().remove("body_immune_to_acid");
		}

		this.legend_armor_upgrade.onUnequip();
	}

	function updateVariant()
	{
	}

});

