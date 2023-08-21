this.gladiators_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.gladiators_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_147.png[/img]{It should be a simple matter, killing a man, but unfamiliarity toughens the flesh: murderers caught in the street, choking away, arms tensed, hands clenched, screaming why won\'t their victims die. The motherly estate come undone, hitting her husband with the fire iron, again and again, and yet he still draws breath long after the flames have died. A bored Vizier unsure of why his torturers struggle with a criminal, the maddened man mocking them as they cut away appendages most important.\n\nBut to a gladiator a man is not just a man, he is a wielder of weapons. Swords, axes, spears, tridents, and more. Once you are past all these manifested defenses, he is mere flesh most familiar, and to dispatch him is not a matter of struggle, but of entertainment. Entertainment! Competition with every ounce of skin in the game, and the revelry of the crowds. These are the things you love. Let the philosophers wax on and off about the nature of how things come to live and die. When you plunge a sword into some fool\'s neck, not only does blood gush upon your blade, but the crowd gushes upon your accomplishment! It is the most wonderful sound in the world! And the women who come after, so hot and bothered they don\'t even wait for you to clean the entrails off before jumping your bones? Glorious.\n\nBut it gets boring, too. How many fights has it been? You can\'t count. How many challenges? You can\'t even name a single one. Not a single one! %g1%, %g2%, and %g3% all agree: you\'re just too good. And they\'re pretty good, too, if you\'re being honest. All four of you agree, though: you shall depart the arenas and forge a champion\'s spirit across the whole world.\n\nThe gladiators have some proclivities for the opulent, particularly for scented baths and jewelry that spells their names, so be prepared to pay a tidy sum for each as you finance their lavish lifestyles outside the comfort of the city states. And so it will be. Your three solid, but not all-time great fighting buddies will display their martial prowess, and you will be matched with a new challenge: learning how to manage warriors (who are not at your level) and their needs.}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Should be easy.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The Gladiators";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		_vars.push([
			"g1",
			brothers[0].getName()
		]);
		_vars.push([
			"g2",
			brothers[1].getName()
		]);
		_vars.push([
			"g3",
			brothers[2].getName()
		]);
	}

	function onClear()
	{
	}

});

