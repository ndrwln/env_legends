this.legend_scroll_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Smart = false
	},
	function create()
	{
		this.m.ID = "effects.scroll";
		this.m.Name = "Scroll Effect";
		this.m.Description = "Scroll Effect";
		this.m.Icon = "ui/rune_sigils/legend_rune_sigil.png";
		this.m.Type = this.Const.SkillType.Special;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

});

