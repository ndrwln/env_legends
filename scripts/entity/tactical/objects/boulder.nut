this.boulder <- this.inherit("scripts/entity/tactical/entity", {
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
		local body = this.addSprite("body");
		body.setBrush("boulder_01");
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.varyColor(0.03, 0.03, 0.03);
		body.Scale = 0.65 + this.Math.rand(0, 35) / 100.0;
		this.setSpriteOcclusion("body", 1, -2, -2);
		this.setBlockSight(true);
	}

	function onFinish()
	{
	}

	function onSerialize( _out )
	{
		this.entity.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.entity.onDeserialize(_in);
	}

});

