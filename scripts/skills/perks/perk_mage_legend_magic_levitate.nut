this.perk_mage_legend_magic_levitate <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_magic_levitate";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMagicLevitate;
		this.m.Description = this.Const.Strings.PerkName.MageLegendMagicLevitate;
		this.m.Icon = "ui/perks/levitate.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.mage_legend_magic_levitate"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/mage_legend_magic_levitate"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.mage_legend_magic_levitate");
	}

});

