this.cart_southern <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return this.Const.Strings.Tactical.EntityName.Cart;
	}

	function getDescription()
	{
		return this.Const.Strings.Tactical.EntityDescription.Cart;
	}

	function setFlipped( _f )
	{
		this.getSprite("body").setHorizontalFlipping(_f);
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("cart_southern_tactical");
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

