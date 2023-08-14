this.legend_vala_inscription_information <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.legend_vala_inscription_information";
		this.m.Name = "Rune Sigils: Information";
		this.m.Description = "";
		this.m.Icon = "ui/perks/legend_vala_inscription_information.png";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 10;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = true;
	}

	function isHidden()
	{
		local runeS = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_shield");
		local runeH = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_helmet");
		local runeA = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_armor");
		local runeW = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_weapon");

		if (this.World.State.getCombatStartTime() != 0)
		{
			return true;
		}

		if (runeS != null || runeH != null || runeA != null || runeW != null)
		{
			return false;
		}

		return true;
	}

	function getTooltip()
	{
		local runeS = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_shield");
		local runeH = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_helmet");
		local runeA = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_armor");
		local runeW = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_vala_inscribe_weapon");
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = "Rune Sigils are symbols made up of common runes that have been connected to and combined with each other in specific patterns, each with its own unique effects.\n\n[b](TO BE CONTINUED)[/b]"
			}
		];

		if (runeS != null && runeS.getCountdownTime() > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "SHIELDS: resumes in " + runeS.getCountdownTime() + " days."
			});
		}
		else if (runeS != null)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "SHIELDS: inscription in progress."
			});
		}

		if (runeH != null && runeH.getCountdownTime() > 0)
		{
			tooltip.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "HELMETS: resumes in " + runeH.getCountdownTime() + " days."
			});
		}
		else if (runeH != null)
		{
			tooltip.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "HELMETS: inscription in progress."
			});
		}

		if (runeA != null && runeA.getCountdownTime() > 0)
		{
			tooltip.push({
				id = 12,
				type = "text",
				icon = "ui/icons/special.png",
				text = "ARMORS: resumes in " + runeA.getCountdownTime() + " days."
			});
		}
		else if (runeA != null)
		{
			tooltip.push({
				id = 12,
				type = "text",
				icon = "ui/icons/special.png",
				text = "ARMORS: inscription in progress."
			});
		}

		if (runeW != null && runeW.getCountdownTime() > 0)
		{
			tooltip.push({
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "WEAPONS: resumes in " + runeW.getCountdownTime() + " days."
			});
		}
		else if (runeW != null)
		{
			tooltip.push({
				id = 13,
				type = "text",
				icon = "ui/icons/special.png",
				text = "WEAPONS: inscription in progress."
			});
		}

		return tooltip;
	}

});

