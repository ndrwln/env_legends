this.perk_steel_brow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.steel_brow";
		this.m.Name = this.Const.Strings.PerkName.SteelBrow;
		this.m.Description = this.Const.Strings.PerkDescription.SteelBrow;
		this.m.Icon = "ui/perks/perk_09.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("effects.steel_brow"))
		{
			this.m.Container.add(this.new("scripts/skills/effects/steel_brow_effect"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.steel_brow");
	}

});

