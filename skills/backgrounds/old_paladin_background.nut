this.old_paladin_background <- this.inherit("scripts/skills/backgrounds/paladin_background", {
	m = {},
	function create()
	{
		this.paladin_background.create();
		this.m.HairColors = this.Const.HairColors.Old;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");
		local body = actor.getSprite("body");
		tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		tattoo_body.Visible = true;
		tattoo_head.setBrush("scar_02_head");
		tattoo_head.Visible = true;
	}

});

