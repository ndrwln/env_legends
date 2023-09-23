this.getroottable().Const.LegendMod.hookAISplitShield <- function ()
{
	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_splitshield", function ( o )
	{
		local onEvaluate = o.onEvaluate;
		o.onEvaluate = function ( _entity )
		{
			local score = onEvaluate(_entity);

			if (this.m.TargetTile == null)
			{
				return score;
			}

			local item = this.m.TargetTile.getEntity().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (item != null && item.getID() == "shield.legend_parrying_dagger")
			{
				this.m.TargetTile = null;
				return this.Const.AI.Behavior.Score.Zero;
			}
			else if (item != null && item.m.IsIndestructible)
			{
				this.m.TargetTile = null;
				return this.Const.AI.Behavior.Score.Zero;
			}
			else
			{
				return score;
			}
		};
	});
	delete this.Const.LegendMod.hookAISplitShield;
};

