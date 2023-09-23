local modID = "mod_close_combat_archer_tooltip";
::mods_registerMod(modID, 2.0, "Close Combat Archer Tooltip");
::mods_queue(modID, "mod_legends, mod_msu", function ()
{
	::mods_hookExactClass("skills/perks/perk_close_combat_archer", function ( o )
	{
		local create = o.create;
		o.create = function ()
		{
			create();
			this.m.Type = ::Const.SkillType.Perk | ::Const.SkillType.StatusEffect;
		};
		o.onGetHitFactors <- function ( _skill, _targetTile, _tooltip )
		{
			local rdef = this.getContainer().getActor().getCurrentProperties().getRangedDefense();

			if (_skill.isRanged())
			{
				local CharDistFromTarget = _targetTile.getDistanceTo(this.getContainer().getActor().getTile());

				if (CharDistFromTarget <= 2)
				{
					_tooltip.push({
						icon = "ui/tooltips/positive.png",
						text = rdef + "% more damage \n" + "  " + this.getName()
					});
				}
				else if (CharDistFromTarget >= 4)
				{
					_tooltip.push({
						icon = "ui/tooltips/negative.png",
						text = rdef + "% less damage \n" + "  " + this.getName()
					});
				}
			}
		};
	});
});

