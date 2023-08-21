this.choose_ambition_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.choose_ambition";
		this.m.Title = "During camp...";
		this.m.HasBigButtons = true;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			Banner = "",
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";

				if (this.World.Assets.getOrigin().getID() == "scenario.paladins")
				{
					this.Text = "[img]gfx/ui/events/event_183.png[/img]{The past few days have been spent mulling over which of Young Anselm\'s beloved Oaths to take on. You feel it in your blood and bones that the right choice is... | Days have come and gone, and in the nights you have mostly sat alone, pondering. But you\'re not always alone. In moments of introspection the Oathtaker Young Anselm arrives, handing you purpose and duty, and this past evening he made it clear to you that the %companyname%\'s next Oath should be... | Between battles internal and out, there remains one eternal war in that of following Young Anselm\'s Oaths. In these trials you must sequester yourself, thinking deeply and alone, until finally, it comes to you! The %companyname%\'s next Oath is most surely... | Sitting alone in thought isn\'t just a physical task. You must clear your mind of all obstruction and distraction, cutting away every element until you are left to darkness in its purest state, where mere glimmers can become divinations, brightly standing amidst all that which is black. And there it is, coming to you in an instant, truth effervescent in its shimmering clarity, held out to you by the glow of Young Anselm\'s hand! The truth of your purpose, and the %companyname%\'s future, it must undertake but one Oath... | Some Oathtakers take to silence, others to songs and ballads. You yourself stand in much quiet, though the noise of the %companyname%\'s doings murmur from the campgrounds. If you are to seek out Young Anselm\'s guidance, then surely he needs to know that you don\'t come alone. As you start to think the Oathtaker is not going to show up, a thought flashes across your mind. The purpose and mission of the %companyname% is now clearer than ever. In an instant, Young Anselm\'s auguries come to your mind and you know that the company shall undertake but one Oath... | The %companyname% would be despondent without purpose. Sensing their needs, you retire yourself to a quiet spot and sit and clear your mind. Young Anselm never allowed himself distractions and you think this will work in your favor just as well. As time begins to pass, a thought nestles within your mind. You trust it to be flighty and will soon go, but instead it only grows and grows, until finally you are made to realize it is a kernel of Young Anselm\'s guidance. And that guidance says only one thing, that the %companyname%\'s Oath should be...}";
				}
				else
				{
					this.Text = "[img]gfx/ui/events/event_58.png[/img]{A fresh, cool breeze is blowing today, and you feel like it\'s a good time for the %companyname% to start something new. You call the men to gather round...\n\nWhat do you tell them? | You feel good today, ready to lead the %companyname% through any challenge to come. You gather the men around, kicking %randombrother% to his feet and telling %randombrother2% to finish scraping away the hairs on his neck later. When their muttering has subsided, you start to address them.\n\nWhat do you tell the men the company will do? | As is customary, you assemble the men to explain the company\'s next steps.%SPEECH_ON%Brothers, the %companyname% must show the world we are forged of a hotter fire than other mercenary bands. As our reputation grows, so will the influx of crowns to our coffers. Let us forge a path to greatness!%SPEECH_OFF%What do you tell the men the company will do? | As the company takes a break, you decide to address the men.%SPEECH_ON%Brothers, I want everyone to know the %companyname% are not just cutthroats and errand boys, but skilled fighters of the first order. Word of our deeds must spread, so that merchants and noblemen are begging us to take their contracts.%SPEECH_OFF%What do you tell the men the company will set out to do? | Sitting and jesting with the men while they check their kit, hone their blades and mend their armor, your mind wanders off to thinking about new ideas for improving the company and its reputation across the lands.\n\nWhat is your conclusion and what do you tell the men? | It falls to you, the commander, to see that the company succeeds not just on the battlefield, but also in fame and riches. And so you spend the evenings pondering about a bigger plan for the %companyname% in your tent while the men talk and laugh around the fire. You\'re never going to become a legend simply by chasing brigands and doing small-time contracts.\n\nWhat do you proclaim to the men the company will set out to do?}";
				}

				local selection = this.World.Ambitions.getSelection();
				this.Options = [];

				foreach( i, s in selection )
				{
					this.Options.push(_event.createOption(s));
				}
			}

		});
	}

	function createOption( _s )
	{
		return {
			Text = _s.getButtonText(),
			Tooltip = _s.getButtonTooltip(),
			Icon = "ui/icons/ambition.png",
			function getResult( _event )
			{
				this.World.Ambitions.setAmbition(_s);
				return 0;
			}

		};
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

