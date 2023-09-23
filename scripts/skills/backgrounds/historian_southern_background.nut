this.historian_southern_background <- this.inherit("scripts/skills/backgrounds/historian_background", {
	m = {},
	function create()
	{
		this.historian_background.create();
		this.m.Bodies = this.Const.Bodies.SouthernSkinny;
		this.m.Faces = this.Const.Faces.SouthernMale;
		this.m.Hairs = this.Const.Hair.SouthernMale;
		this.m.HairColors = this.Const.HairColors.Southern;
		this.m.Beards = this.Const.Beards.Southern;
		this.m.Ethnicity = 1;
		this.m.BeardChance = 90;
		this.m.Names = this.Const.Strings.SouthernNames;
		this.m.LastNames = this.Const.Strings.SouthernNamesLast;
	}

	function onBuildDescription()
	{
		return "{Always a voracious reader, %name%\'s early life consisted of long nights in the many libraries of %randomcitystate%. | Bullied by his stronger peers, a young %name% retreated into the world of books. | Looking for where man\'s past truly lies, %name% read books and studied human nature. | With so many changes in the world, %name% decided to help record them. | A quick-learner with a penchant for a good read, %name% sought to envision the world on paper for others. | A scholar of %randomcitystate%\'s college, %name% records the histories of the world for future generations. | Chilled by dark events in the world, %name% stopped studying plants and began recording human history.} {A proper historian seeks the closest sources he can get, which has brought the man to the company of mercenaries. | After desert raiders ruined his written works, the man strapped on his boots to carve out new research - personally. | When his professor said his research was rubbish, the historian went out into the world to prove him wrong. | Accused of plagiarism, the historian was kicked out of academia. He seeks redemption in the world of what he studied: war. | Using his position in academia to bed women, eventual scandals and controversies drove the historian from his field, and left him penniless and ready to take on any job. | Bored with reading about adventurers, the historian figured he\'d suit up to fashion himself a closer look at the real thing. | With so many mercenary bands floating around, the historian sought to attach himself for some real-life studying.} {%name% has little in common with actual soldiers, but his imaginative mind fancies a good battle nonetheless. | While %name% spent all his life writing, he spent exactly none of it fighting. Until now. | %name% has the itch to record your outfit\'s travels. He can help by grabbing a sword and suiting up. | A bag of books is hefted over %name%\'s shoulder. You suggest a flail as replacement. It\'s similar, but pointier and stabbier. | %name% is frequently found scribbling notes as he still sees the world with a researcher\'s eye. | %name% comes with a pocketful of quill pens. The feathers would make for some pretty good arrows. | You can place good faith in %name%\'s earnest want to research, but maybe not so much faith in his ability to swing a sword. | %name%\'s time with the outfit is to develop a theory, but can he survive the experiments? | You promise %name% that, shall he perish, you will find a way to record his life. He thanks you and hands over his will. It\'s written in a language foreign to you and you can read absolutely none of it. You smile back anyway.}";
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[
				1,
				"oriental/cloth_sash"
			]
		]));
		local helm = this.Const.World.Common.pickHelmet([
			[
				1,
				"oriental/southern_head_wrap"
			]
		]);
		items.equip(helm);
	}

});

