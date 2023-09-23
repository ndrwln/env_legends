this.desert_ruin3 <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Ruin;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Ruin;
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("desert_detail_ruins_03");
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.varyColor(0.03, 0.03, 0.03);
		body.Scale = 0.8 + this.Math.rand(0, 20) / 100.0;
		this.setBlockSight(true);
	}

});

