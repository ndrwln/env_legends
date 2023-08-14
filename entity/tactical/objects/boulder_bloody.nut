this.boulder_bloody <- this.inherit("scripts/entity/tactical/entity", {
	m = {
		IsRock = true
	},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Boulder;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Boulder;
	}

	function onInit()
	{
		local flipped = this.Math.rand(0, 100) < 50;
		local body = this.addSprite("body");
		body.setBrush("boulder_01");
		body.setHorizontalFlipping(flipped);
		body.varyColor(0.03, 0.03, 0.03);
		local blood = this.addSprite("blood");
		blood.setBrush("boulder_01_blood");
		blood.setHorizontalFlipping(flipped);
		this.setSpriteOcclusion("body", 1, -2, -2);
		this.setBlockSight(true);
	}

	function onFinish()
	{
	}

});

