this.mage_legend_magic_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ResolveScaling = 1,
		ResolveCuttoff = 50
	},
	function create()
	{
	}

	function getTooltip()
	{
		return this.getDefaultTooltip();
	}

	function isUsable()
	{
		if (!this.getContainer().getActor().isArmedWithMagicStaff())
		{
			return false;
		}

		return this.skill.isUsable() && (!this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()));
	}

	function getCurrentResolve()
	{
		return this.getContainer().getActor().getCurrentProperties().getBravery();
	}

	function getResolveScaling()
	{
		local resolve = this.getCurrentResolve();
		local resolveDifference = resolve - this.m.ResolveCuttoff;

		if (resolveDifference <= 0)
		{
			return 0;
		}

		local scaling = resolveDifference / this.m.ResolveScaling;

		if (typeof scaling == "float")
		{
			return scaling.tointeger();
		}

		return scaling;
	}

});

