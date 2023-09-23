this.perk_mage_legend_magic_soothing_wind <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.mage_legend_magic_soothing_wind";
		this.m.Name = this.Const.Strings.PerkName.MageLegendMagicSoothingWind;
		this.m.Description = this.Const.Strings.PerkDescription.MageLegendMagicSoothingWind;
		this.m.Icon = "ui/perks/mage_legend_magic_soothing_wind_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.mage_legend_magic_soothing_wind"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/mage_legend_magic_soothing_wind"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.mage_legend_magic_soothing_wind");
	}

});

