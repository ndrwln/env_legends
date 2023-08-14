this.brush_forest <- this.inherit("scripts/entity/tactical/entity", {
	m = {
		IsBush = true
	},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Brush;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Brush;
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("brush_0" + this.Math.rand(2, 2));
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.setBrightness(0.8);
		body.varyColor(0.07, 0.07, 0.07);
		body.Scale = 0.9 + this.Math.rand(0, 10) / 100.0;
		local web = this.addSprite("web");
		web.setBrush("web_03");
		web.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		web.Scale = body.Scale * 0.9;
		web.Visible = false;
		this.setBlockSight(true);
	}

});

