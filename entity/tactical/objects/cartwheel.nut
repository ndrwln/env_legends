this.cartwheel <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Cartwheel;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Cartwheel;
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("road_cartwheel");
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
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

