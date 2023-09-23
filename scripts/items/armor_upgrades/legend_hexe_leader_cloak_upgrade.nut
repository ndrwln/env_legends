this.legend_hexe_leader_cloak_upgrade <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.legend_hexe_leader_cloak";
		this.m.Name = "Hexen Redback Silk Cloak";
		this.m.Description = "This flowing cloak is made from spider web, and offers excellent protection against ranged attacks.";
		this.m.ArmorDescription = "A cloak of spider silk offers extra protection";
		this.m.Icon = "armor_upgrades/upgrade_cloak_purple.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_cloak_purple.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_cloak_purple.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "cloak_purple";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "cloak_purple_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "cloak_purple_dead";
		this.m.Value = 12000;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] and increases resolve by [color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color]"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Reduces any ranged damage to the body by [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] and increases resolve by [color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color]"
		});
	}

	function onUpdateProperties( _properties )
	{
		_properties.BraveryMult *= 1.25;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			_properties.DamageReceivedRangedMult *= 0.9;
		}
	}

});

