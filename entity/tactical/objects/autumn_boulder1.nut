this.autumn_boulder1 <- this.inherit("scripts/entity/tactical/entity", {
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
		local v = this.Math.rand(2, 3);
		local bottom = this.addSprite("bottom");
		bottom.setBrush("autumn_stone_0" + v + "_bottom");
		bottom.setHorizontalFlipping(flip);
		bottom.varyColor(0.03, 0.03, 0.03);
		bottom.Scale = 0.8 + this.Math.rand(0, 20) / 100.0;
		local top = this.addSprite("top");
		top.setBrush("autumn_stone_0" + v + "_top");
		top.setHorizontalFlipping(flip);
		top.Color = bottom.Color;
		top.Scale = bottom.Scale;
		this.setSpriteOcclusion("top", 1, 2, -3);
		this.setBlockSight(true);
	}

});

