this.getroottable().Const.LegendMod.hookAIAgent <- function ()
{
	::mods_hookBaseClass("ai/tactical/agent", function ( o )
	{
		while (!("StrategyGenerator" in o.m))
		{
			o = o[o.SuperName];
		}

		if (!("_mod_legend" in o))
		{
			o._mod_legend <- true;
			o.m.PriorityTarget <- null;
		}

		o.setPriorityTarget <- function ( _entity )
		{
			this.m.PriorityTarget = _entity;
		};
		o.getPriorityTarget <- function ()
		{
			return this.m.PriorityTarget;
		};
		o.getVisibleOpponents <- function ()
		{
			this.getStrategy().compileKnownOpponents();
			local knownOpponents = this.getKnownOpponents();
			local entityRet = [];

			if (knownOpponents.len() == 0)
			{
				return [];
			}

			foreach( o in knownOpponents )
			{
				if (!o.Actor.isNull() && o.Actor.isAlive() && o.Actor.isPlacedOnMap() && o.Actor.get().getTile().getDistanceTo(this.getActor().getTile()) <= this.getActor().getCurrentProperties().getVision())
				{
					entityRet.push(o.Actor.get());
				}
			}

			return entityRet;
		};
	});
	delete this.Const.LegendMod.hookAIAgent;
};

