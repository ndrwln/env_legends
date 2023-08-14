this.allied_civilians_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.allied_civilians";
		this.m.Duration = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We need allies. Forging a bond of friendship and trust with one of the towns will\nget the company better prices, more volunteers and more steady work.";
		this.m.UIText = "Get to \'Friendly\' relations with a civilian faction";
		this.m.RewardTooltip = "Having good relations will get you better prices and more men to hire.";
		this.m.TooltipText = "Increase the relation with a civilian faction of one of the world\'s villages or towns to \'Friendly\' by fulfilling contracts given in the faction\'s settlement. Failing contracts or betraying their trust will lower your relations. Increasing relations with city states takes longer than increasing relations with small villages. Noble houses do not count as civilian factions.";
		this.m.SuccessText = "[img]gfx/ui/events/event_65.png[/img]Deciding that %friendlytown% is a good place to invest your efforts, you decide to offer the protection of the company and take up any work suitable to your talents. You act like a gentleman in your dealings with the locals, and encourage the men to mind their manners while in the settlement. There was of course some griping at first. %brawler% was sorely disappointed to give up brawling with the farmers, especially with the %companyname% spending so much time in %friendlytown%.\n\nBut you convinced the men that having a friendly base of operations is important in your line of work, as it meant getting better prices on the market and more people willing to join your motley band. It\'s also much less tiring not having to dodge the militia all the time. You even enlisted the men to do some small tasks in exchange for nothing but goodwill.%SPEECH_ON%I found that little brat who wandered off and dragged him right home.%SPEECH_OFF%%randombrother% brags, quickly outvied by %randombrother2%.%SPEECH_ON%I went to the market for the old spinster, split her firewood for winter, and even put out her washing, but I draw the line at rescuing treed cats.%SPEECH_OFF%";
		this.m.SuccessButtonText = "This will help us.";
	}

	function onUpdateScore()
	{
		local allies = this.World.FactionManager.getAlliedFactions(this.Const.Faction.Player);

		foreach( a in allies )
		{
			local f = this.World.FactionManager.getFaction(a);

			if (f != null && (f.getType() == this.Const.FactionType.Settlement || f.getType() == this.Const.FactionType.OrientalCityState) && f.getPlayerRelation() >= 70.0)
			{
				this.m.IsDone = true;
				return;
			}
		}

		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		local allies = this.World.FactionManager.getAlliedFactions(this.Const.Faction.Player);

		foreach( a in allies )
		{
			local f = this.World.FactionManager.getFaction(a);

			if (f != null && (f.getType() == this.Const.FactionType.Settlement || f.getType() == this.Const.FactionType.OrientalCityState) && f.getPlayerRelation() >= 70.0)
			{
				return true;
			}
		}

		return false;
	}

	function onPrepareVariables( _vars )
	{
		local allies = this.World.FactionManager.getAlliedFactions(this.Const.Faction.Player);

		foreach( a in allies )
		{
			local f = this.World.FactionManager.getFaction(a);

			if (f != null && (f.getType() == this.Const.FactionType.Settlement || f.getType() == this.Const.FactionType.OrientalCityState) && f.getPlayerRelation() >= 70.0)
			{
				_vars.push([
					"friendlytown",
					f.getName()
				]);
				break;
			}
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() > 1)
		{
			for( local i = 0; i < brothers.len(); i = i )
			{
				if (brothers[i].getSkills().hasSkill("trait.player"))
				{
					brothers.remove(i);
					break;
				}

				i = ++i;
			}
		}

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.brawler")
			{
				_vars.push([
					"brawler",
					bro.getName()
				]);
				return;
			}
		}

		foreach( bro in brothers )
		{
			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Combat))
			{
				_vars.push([
					"brawler",
					bro.getName()
				]);
				return;
			}
		}

		_vars.push([
			"brawler",
			brothers[this.Math.rand(0, brothers.len() - 1)].getName()
		]);
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
	}

});

