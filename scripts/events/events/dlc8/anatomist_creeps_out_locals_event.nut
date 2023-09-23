this.anatomist_creeps_out_locals_event <- this.inherit("scripts/events/event", {
	m = {
		Anatomist = null
	},
	function create()
	{
		this.m.ID = "event.anatomist_creeps_out_locals";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 7.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_43.png[/img]{Despite the noise of the surrounding villagers and their commerce, %anatomist% opens up a book of dissections and starts poring through its contents. While a local peasant might not be able to read the texts, he can absolutely see the disgusting images drawn on the pages: lurid documentation of opened bodies, identifications of body parts the peasant didn\'t even know he had, and a number of inane symbolism that any layman would use to invite his own devilments. Unsurprisingly, the peasant takes an interest in the anatomist\'s tome.%SPEECH_ON%So are you some sort of sorcerer or something?%SPEECH_OFF%Smiling, %anatomist% turns and says if the peasant thought that was remotely true, would he ever ask it of him? The peasant leans back.%SPEECH_ON%Oh, so yer a wiseacre, huh? Some smartass with a book for fools.%SPEECH_OFF%%anatomist% watches the peasant turn and leave, then looks at you with a wide grin.%SPEECH_ON%That peasant had a curious bulge on his cheek. He\'ll be dead within a year. Two if he\'s unlucky and death is too generous with its time.%SPEECH_OFF% | Taking a break from the road and sellswording, %anatomist% sets down on a stone and opens up one of his books. A few moments into his studies, a little girl approaches, flowers in hand. She hands him one and asks what it is he\'s reading. The anatomist holds up his book and turns it around. She stares at the grisly drawings of beasts and monsters ripped open and their curious insides churned out. After a pause, she slowly pushes the book down to stare at the anatomist holding it. She says.%SPEECH_ON%I know of a beast you could have.%SPEECH_OFF%You and the anatomist turn a keen ear. The little girl lowers her voice, nearly hissing with childlike conspiracy.%SPEECH_ON%My little brother. He\'s two, but I swear he forsakes the old gods and the devilry is in him.%SPEECH_OFF%%anatomist% nods dutifully.%SPEECH_ON%But of course. I will put it in my notes to see to this matter, and if I have time I will find the foulness within your kin.%SPEECH_OFF%The little girl thanks the anatomist once more and gives him more flowers for his promised aid. %anatomist% holds the flowers softly, rolling them back and forth as he goes back to his reading, a small smile on his face. You\'re hoping that the smile is just an indicator that he\'s bemused by a child, and not that he actually wishes to see to some ungodly boy. | As the company takes a rest, a man stands off at the side of the path, watching curiously. He nods.%SPEECH_ON%You lot have the stench of death about you, but I can\'t say I\'d take ye for butcherers or executioners. Yer something else entire.%SPEECH_OFF%Without missing a beat, %anatomist% steps up and eyes the man, getting right up in his face, and the man leans away, but doesn\'t retreat. The anatomist\'s lost gaze ends with a dutiful nod.%SPEECH_ON%You are right, we do carry a stench, as do you. Ours is a matter of science, yours a matter of disease. And yours, hmm, yes, yours is a hint of the pox. Lemme see your feet.%SPEECH_OFF%The peasant nervously declines the request. He steps back as the anatomist hunts forward, fingers clambering like a spider, his eyes wide. The man eventually screams and runs off. %anatomist% turns around with a smile.%SPEECH_ON%What a curious subject, that man. I believe he was very, very ill, but he does not yet know it. Oh well.%SPEECH_OFF% | You come across an open-air wagon carrying a casket, its pathing trailed by a retinue of mourners. %anatomist% steps out from the company and inquires about the death of the individual. They said it was from a beast\'s strike. Curious, the anatomist inquires what sort of beast would be capable killing a man. The people look at one another before opening the coffin to reveal a man with a small scratch across his cheek. The wound had long since turned dark purple with veins of green and other disturbing discoloration, evidence that his demise was one of being stricken. One of the peasants looks up.%SPEECH_ON%It was his housecat that did it. Nicked him right there, and he paid little mind to it, then the colors went out and wandered his flesh until he was dead within two nights.%SPEECH_OFF%The anatomist shares some words with the mourners then returns to you. He sighs.%SPEECH_ON%T\'was a simple blighting. All he needed to do was clean the cut. Unfortunate, though I am happy that my learnings are giving me real world insights, even if it is too late to apply them.%SPEECH_OFF%You ask what came of the cat. The anatomist nods and says it was in the coffin with its victim, the feline \'beast\' tucked there seemingly unawares of its final destination.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "If only he was this happy about mercenary work, too.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Anatomist.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Paladins)
		{
			return;
		}

		if (this.World.Assets.getOrigin().getID() != "scenario.anatomists")
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();

		if (!currentTile.HasRoad)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local anatomistCandidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.anatomist")
			{
				anatomistCandidates.push(bro);
			}
		}

		if (anatomistCandidates.len() == 0)
		{
			return;
		}

		this.m.Anatomist = anatomistCandidates[this.Math.rand(0, anatomistCandidates.len() - 1)];
		this.m.Score = 4 * anatomistCandidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"anatomist",
			this.m.Anatomist.getName()
		]);
	}

	function onClear()
	{
		this.m.Anatomist = null;
	}

});

