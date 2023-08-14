this.legend_vala_information <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_vala_information";
		this.m.Name = "Vala Information: Skills";
		this.m.Icon = "ui/backgrounds/legend_vala.png";
		this.m.Type = this.Const.SkillType.Background | this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Background + 1;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = true;
	}

	function isHidden()
	{
		if (this.World.State.getCombatStartTime() != 0)
		{
			return true;
		}

		return false;
	}

	function getTooltip()
	{
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Most of the Vala\'s skills require her staff and scale in one way or another with the strength of her Resolve."
			},
			{
				id = 4,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Chants are sorcerous incantations delivered by song. These affect an area around the Vala and last until the start of her next turn."
			},
			{
				id = 5,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Trances are altered states entered into by the Vala. She will remain in these until her task is either completed or interrupted. Receiving damage of any kind, or becoming too fatigued to continue, will drop the Vala out of an active trance."
			}
		];
		return tooltip;
	}

});

