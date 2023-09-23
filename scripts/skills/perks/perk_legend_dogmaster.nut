this.perk_legend_dogmaster <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_dogmaster";
		this.m.Name = this.Const.Strings.PerkName.LegendDogMaster;
		this.m.Description = this.Const.Strings.PerkDescription.LegendDogMaster;
		this.m.Icon = "ui/perks/dog_handling.png";
		this.m.IconDisabled = "ui/perks/dog_handling_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_dog_master"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_dog_master"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_dog_master");
	}

});

