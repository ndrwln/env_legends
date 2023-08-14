this.perk_legend_net_repair <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_net_repair";
		this.m.Name = this.Const.Strings.PerkName.LegendNetRepair;
		this.m.Description = this.Const.Strings.PerkDescription.LegendNetRepair;
		this.m.Icon = "ui/perks/net_perk.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		local resolve = actor.getCurrentProperties().Bravery;

		if (item != null)
		{
			if (item.getID() == "tool.throwing_net" || item.getID() == "tool.reinforced_throwing_net" || item.getID() == "tool.legend_broken_throwing_net")
			{
				_properties.MeleeDefense += 10;
			}
		}
	}

});

