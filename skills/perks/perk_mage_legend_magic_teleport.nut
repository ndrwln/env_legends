this.perk_mage_legend_magic_teleport <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_magic_teleport";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMagicTeleport;
		this.m.Description = this.Const.Strings.PerkDescription.MageLegendMagicTeleport;
		this.m.Icon = "ui/perks/teleport_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.mage_legend_magic_teleport"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/mage_legend_magic_teleport"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.mage_legend_magic_teleport");
	}

});

