this.boulder_forest <- this.inherit("scripts/entity/tactical/entity", {
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
		body.setBrush("boulder_0" + this.Math.rand(2, 4));
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.Scale = 0.8 + this.Math.rand(0, 20) / 100.0;
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

