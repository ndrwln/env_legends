this.perk_inspire <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.inspire";
		this.m.Name = this.Const.Strings.PerkName.Inspire;
		this.m.Description = this.Const.Strings.PerkDescription.Inspire;
		this.m.Icon = "ui/perks/inspire_circle.png";
		this.m.IconDisabled = "ui/perks/inspire_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.inspire"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/inspire_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.inspire");
	}

});

