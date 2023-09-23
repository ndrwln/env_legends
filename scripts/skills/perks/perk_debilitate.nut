this.perk_debilitate <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.debilitate";
		this.m.Name = this.Const.Strings.PerkName.Debilitate;
		this.m.Description = this.Const.Strings.PerkDescription.Debilitate;
		this.m.Icon = "ui/perks/perk_34.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.debilitate"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/debilitate"));
		}
	}

});

