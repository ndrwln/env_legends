this.autumn_boulder2 <- this.inherit("scripts/entity/tactical/entity", {
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
		local flip = this.Math.rand(0, 1) == 1;
		local bottom = this.addSprite("bottom");
		bottom.setBrush("autumn_stone_01");
		bottom.setHorizontalFlipping(flip);
		bottom.varyColor(0.03, 0.03, 0.03);
		bottom.Scale = 0.8 + this.Math.rand(0, 20) / 100.0;
		this.setBlockSight(true);
	}

});

